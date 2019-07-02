#!/bin/bash

set_title () {
  echo -en "\033]0; $1 \a"
}
