GPPPARAMS = -m32 -fno-use-cxa-atexit -nostdlib  -fno-rtti -fno-exceptions -fno-leading-underscore
ASPARAM = --32
LDPARAMS = -melf_i386
objects = loader.o kernel.o

%.o: %.cpp
	g++ $(GPPPARAMS) -o $@ -c $<

%.o: %.s
	as $(ASPARAM) -o $@ $<

mykernel.bin: linker.ld $(objects)
	ld $(LDPARAMS) -T $< -o $@ $(objects)

