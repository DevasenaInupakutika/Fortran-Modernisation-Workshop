module Solver_mod
   use Types_mod

   use RHS_mod

   implicit none

   public :: fd1d_heat_explicit

contains

    subroutine fd1d_heat_explicit( x, t, dt, cfl, h, h_new )

      implicit none

      !Subroutine arguments      
      real(kind=DP), intent(in) :: cfl
      real(kind=DP), intent(in) :: dt
      real(kind=DP), dimension(:), intent(in) :: h
      real(kind=DP), dimension(:), intent(out) :: h_new
      real(kind=DP), intent(in) :: t
      real(kind=DP), dimension(:), intent(in) :: x

      !Local arguments
      integer(kind=SI) :: j
      real(kind=DP), dimension(size(x)) :: f

      do j = 1, size(x)
        f(j) = func( j, x )
      end do

      h_new(1) = 0.0_DP

      do j = 2, size(x) - 1
        h_new(j) = h(j) + dt * f(j) + cfl * ( h(j-1) - 2.0_DP * h(j) + h(j+1) )
      end do

      ! set the boundary conditions again
      h_new(1) = 90.0_DP
      h_new(size(x)) = 70.0_DP
    end subroutine fd1d_heat_explicit

end module Solver_mod

