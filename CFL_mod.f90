module CFL_mod

   use Types_mod
 
   implicit none

   public :: fd1d_heat_explicit_cfl

contains

       subroutine fd1d_heat_explicit_cfl( k, t_num, t_min, t_max, x_num, x_min, x_max, cfl )

      implicit none

      !subroutine arguments
      real(kind=DP), intent(out) :: cfl
      real(kind=DP), intent(in) :: k
      real(kind=DP), intent(in) :: t_max
      real(kind=DP), intent(in) :: t_min
      integer(kind=SI), intent(in) :: t_num
      real(kind=DP), intent(in) :: x_max
      real(kind=DP), intent(in) :: x_min
      integer(kind=SI), intent(in) :: x_num

      !Local arguments
      real(kind=DP) :: dx
      real(kind=DP) :: dt

      dx = ( x_max - x_min ) / dble( x_num - 1 )
      dt = ( t_max - t_min ) / dble( t_num - 1 )

      cfl = k * dt / dx / dx

      write ( *, '(a)' ) ' '
      write ( *, '(a,g14.6)' ) '  CFL stability criterion value = ', cfl

    end subroutine fd1d_heat_explicit_cfl

end module CFL_mod
