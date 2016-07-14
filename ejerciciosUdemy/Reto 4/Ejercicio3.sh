#!/bin/bash
read -p "Start or Stop: " RESPONSE


case $RESPONSE in
  Start )
  echo "BRMMMMMMM"
    ;;
  Stop )
  echo "PTSshhshshsh"
    ;;
  *)
  echo "What?"
  exit 1
  ;;
esac
