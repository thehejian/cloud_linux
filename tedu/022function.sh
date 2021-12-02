#!/bin/bash

abc () {
	mkdir -p /home/$1
	cd /home/$1
	pwd
}

abc woqu
