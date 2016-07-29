module IO_mod
   use Types_mod

   implicit none

   public :: r8mat_write, r8vec_linspace, r8vec_write

contains

   subroutine r8mat_write( output_filename, table )

      implicit none

      !Subroutine arguments
      character(len=*), intent(in) :: output_filename
      real(kind=DP), intent(in) :: table(:,:)

      !Local arguments
      integer(kind=SI) :: j     
      integer(kind=SI) :: output_unit
      character(len=30) :: string 

      integer(kind=SI) :: m
      integer(kind=SI) :: n
      
      m = size(table(:,:), 1)
      n = size(table(:,:), 2)
      output_unit = 10
      open( unit = output_unit, file = output_filename, status = 'replace' )

      write ( string, '(a1,i8,a1,i8,a1,i8,a1)' ) '(', m, 'g', 24, '.', 16, ')'

      do j = 1, n
        write ( output_unit, string ) table(1:m, j)
      end do

      close( unit = output_unit )
    end subroutine r8mat_write


    subroutine r8vec_linspace ( a_first, a_last, a )

      implicit none

      !Subroutine arguments
      real(kind=DP), dimension(:), intent(out) :: a
      real(kind=DP), intent(in) :: a_first
      real(kind=DP), intent(in) :: a_last
      
      !Local arguments
      integer(kind=SI) :: i

      integer(kind=SI) :: n

      n = size(a)

      do i = 1, n
        a(i) = ( dble( n - i ) * a_first + dble( i - 1 ) * a_last ) / dble( n - 1 )
      end do

    end subroutine r8vec_linspace

    subroutine r8vec_write ( output_filename, x )

      implicit none

      !Subroutine arguments
      character* ( * ), intent(in) :: output_filename
      real(kind=DP), dimension(:), intent(in) :: x

      !Local arguments
      integer(kind=SI) :: m
      integer(kind=SI) :: j
      integer(kind=SI) :: output_unit

      integer(kind=SI) :: n
      
      n = size(x)
      output_unit = 11
      open( unit = output_unit, file = output_filename, status = 'replace' )

      do j = 1, n
        write ( output_unit, '(2x,g24.16)' ) x(j)
      end do

      close ( unit = output_unit )
  end subroutine r8vec_write


end module IO_mod

