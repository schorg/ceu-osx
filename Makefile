CFLAGS = -DCEU_DEBUG #-DCEU_DEBUG_TRAILS
#CFLAGS = -DSDL_MATH

SDL2_LIBS = -lSDL2_gfx -lSDL2_image -lSDL2_ttf -lSDL2_net -lSDL2_mixer

all:
	ceu --cpp-exe "CPP" --cpp-args "-I." $(CEUFILE)
	clang -g -Os main.c $(CFLAGS) `sdl2-config --cflags --libs` $(SDL2_LIBS) \
		-o $(basename $(CEUFILE)).exe

sim:
	ceu --timemachine --cpp-exe "CPP" --cpp-args "-I. -DCEUFILE=$(CEUFILE)" sim.ceu
	clang -g -Os -DCEU_TIMEMACHINE $(CFLAGS) main.c \
		`sdl2-config --cflags --libs` $(SDL2_LIBS) \
		-o $(basename $(CEUFILE)).exe

sim-tst:
	ceu --timemachine --cpp-exe "CPP" --cpp-args "-I. -DCEU_TIMEMACHINE" sim-tst.ceu
	#gcc main.c $(CFLAGS) -lSDL2
	clang -g -Os -DCEU_TIMEMACHINE $(CFLAGS) main.c \
		`sdl2-config --cflags --libs` $(SDL2_LIBS) \
		-o sim-tst.exe

# demo:
# 	ceu --cpp-exe "CPP" --cpp-args "-I. -DALL" samples/all.ceu
# 	gcc -g -Os main.c -DALL $(CFLAGS) -lpthread -lm \
# 		-lSDL2 -lSDL2_image -lSDL2_mixer -lSDL2_ttf -lSDL2_net -lSDL2_gfx \
# 		-o samples/all.exe

ui-scroll:
	ceu --cpp-exe "CPP" --cpp-args "-I. -D__UI_SCROLL_CEU" ui-scroll.ceu
	clang -g main.c $(CFLAGS) `sdl2-config --cflags --libs`

ui-grid:
	ceu --cpp-exe "CPP" --cpp-args "-I. -D__UI_GRID_CEU" ui-grid.ceu
	clang -g main.c $(CFLAGS) `sdl2-config --cflags --libs`

# ui-texture:
# 	ceu --cpp-exe "CPP" --cpp-args "-I. -D__UI_TEXTURE_CEU" ui-texture.ceu
# 	clang main.c $(CFLAGS) `sdl2-config --cflags --libs` $(SDL2_LIBS)

clean:
	find . -name "*.exe"  | xargs rm -f
	find . -name "_ceu_*" | xargs rm -f

.PHONY: all clean
