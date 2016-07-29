#Starting of the Makefile for Heat calculation FORTRAN code.

#Compiler specification
FC = gfortran
LIB = fmw
LIBDIR = .
INCLUDEDIR = .

fd1d_heat_explicit.exe: fd1d_heat_explicit.o Solver_mod.o IO_mod.o CFL_mod.o RHS_mod.o Types_mod.o
	$(FC) $^ -o $@

Types_mod.o: Types_mod.f90
	$(FC) -c Types_mod.f90

RHS_mod.o: RHS_mod.f90 Types_mod.o
	$(FC) -c RHS_mod.f90

CFL_mod.o: CFL_mod.f90 Types_mod.o
	$(FC) -c CFL_mod.f90

IO_mod.o: IO_mod.f90 Types_mod.o
	$(FC) -c IO_mod.f90

Solver_mod.o: Solver_mod.f90 RHS_mod.o 
	$(FC) -c Solver_mod.f90

fd1d_heat_explicit.o: fd1d_heat_explicit.f90 Solver_mod.o IO_mod.o CFL_mod.o RHS_mod.o Types_mod.o
	$(FC) -c -I $(INCLUDEDIR) fd1d_heat_explicit.f90

.PHONY: clean

clean: 
	rm -f *.mod *.o *.png fd1d_heat_explicit.exe

#End of the Makefile
