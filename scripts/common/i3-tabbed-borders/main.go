// Removes the border of tiled windows inside tabbed/stacked containers and
// restores "pixel N" everywhere else. Floating windows are left alone.
package main

import (
	"flag"
	"fmt"
	"log"
	"strings"

	"go.i3wm.org/i3/v4"
)

var width = flag.Int64("width", 5, "pixel border width for non-tabbed windows")

// walk visits tiled windows only (floating nodes are not traversed).
func walk(n *i3.Node, parent *i3.Node, cmds *[]string) {
	if n.Window != 0 && parent != nil {
		tabbed := parent.Layout == i3.Tabbed || parent.Layout == i3.Stacked
		switch {
		case tabbed && n.Border != i3.NoBorder:
			*cmds = append(*cmds, fmt.Sprintf("[con_id=%d] border none", n.ID))
		case !tabbed && (n.Border != i3.PixelBorder || n.CurrentBorderWidth != *width):
			*cmds = append(*cmds, fmt.Sprintf("[con_id=%d] border pixel %d", n.ID, *width))
		}
	}
	for _, c := range n.Nodes {
		walk(c, n, cmds)
	}
}

func update() {
	tree, err := i3.GetTree()
	if err != nil {
		log.Print(err)
		return
	}
	var cmds []string
	walk(tree.Root, nil, &cmds)
	if len(cmds) == 0 {
		return
	}
	if _, err := i3.RunCommand(strings.Join(cmds, "; ")); err != nil {
		log.Print(err)
	}
}

func main() {
	flag.Parse()
	update()

	recv := i3.Subscribe(i3.WindowEventType, i3.BindingEventType, i3.WorkspaceEventType)
	defer recv.Close()
	for recv.Next() {
		update()
	}
	log.Fatal(recv.Close())
}
