module RHS_mod
   use Types_mod

   implicit none

   public :: func

contains

   function func( j, x ) result ( d )
      implicit none

      integer(kind=SI), intent(in) :: j
      real(kind=DP), dimension(:), intent(in) :: x

      real(kind=DP) :: d

      d = 0.0_DP
   end function func

end module RHS_mod
