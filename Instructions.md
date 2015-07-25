## Cloning this repository

	git clone https://github.com/schorg/ceu-osx

## Installing Homebrew

See: http://brew.sh

## Installing Lua 5.1

Check your lua installation

	brew info lua

The installations of lua5.1 and lua5.2 are currently conflicting.
If lua: stable 5.2.x is installed, uninstall it if you do not need it.

	brew uninstall lua

Install Lua 5.1

	brew install lua51 --with-completion

Install the Lua LPeg library:

	luarocks-5.1 install lua-lpeg

Link lua to lua-5.1

	ln -s /usr/local/bin/lua-5.1 /usr/local/bin/lua


## Building Céu

Build Céu like that:

	git clone https://github.com/fsantanna/ceu
	cd ceu/
	lua pak.lua

Copy run_tests_osx.lua to the ceu directory

	cp ../ceu-osx/run_tests_osx.lua .
	chmod a+x run_tests_osx.lua

The Test are partially adapted to compilation with clang etc.

	./run_tests_osx.lua

Copy ceu to /usr/local/bin

	cp ceu /usr/local/bin/

Go back to top.

	cd ..

## Using Céu with SDL

Install the following SDL2 libraries:

	brew install sdl2
	brew install sdl2_image sdl2_mixer sdl2_ttf sdl2_net sdl2_gfx

Download ceu-sdl:

	git clone https://github.com/fsantanna/ceu-sdl
	cd ceu-sdl/

In order to build the SDL samples substitute the Makefile.

	cp ../ceu-osx/Makefile .

On OS X we use clang for compilation, CPP (which seems to be a shortcut for
clang -E) as the c-preprocessor for Céu. CPP Mac OS X seems to be more strict
than cpp on Linux concerning the include path ("-I." instead of "-I .").

Use make to build the samples, for example:

	make CEUFILE=samples/sdl1.ceu

And run it:

	./samples/sdl1.exe

For running ceu from the command line for Céu programs with includes, call ceu
with the suitable cpp-exe and cpp-args parameters. For example

	ceu --cpp-exe="CPP" --cpp-args = "-I." <your file>.ceu

## Uninstalling Céu

Uninstall brew formala

	brew uninstall sdl2_image sdl2_mixer sdl2_ttf sdl2_net sdl2_gfx
	brew uninstall sdl2
	luarocks-5.1 uninstall lua-lpeg
	brew uninstall lua51

Uninstall manually created files and links

	rm /usr/local/bin/ceu
	rm /usr/local/bin/lua

Delete the cloned repositories.
