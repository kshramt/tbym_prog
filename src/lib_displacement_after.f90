#include "utils.h"
module lib_displacement_after
  USE_UTILS_H
  use iso_fortran_env, only: OUTPUT_UNIT
  use lib_io, only: new_unit, mkdir_p
  use lib_character, only: s

  implicit none

  private
  public:: DisplacementAfterConfig, BinnedHeight
  public:: INPUT_DIR, OUTPUT_DIR
  public:: write, read, get

  type DisplacementAfterConfig
    integer:: nBins
    integer:: nElementsParParticleMax
  end type DisplacementAfterConfig

  type BinnedHeight
    Real:: xCenter, width, height
    Logical:: isIncludeLeft     ! xL <= x < xRならば.true.。xL < x <= xRならば.false.
  end type BinnedHeight

  interface write
    module procedure write_binned_heights
    module procedure write_circular_elements_file, write_circular_elements_io
  end interface write

  interface get
    module procedure get_binned_heights
  end interface get

  interface read
    module procedure read_config
  end interface read

  interface validate
    module procedure validate_config
  end interface validate

  character(len = *), parameter:: INPUT_DIR = 'inputs/displacement_after'
  character(len = *), parameter:: OUTPUT_DIR = 'outputs/displacement_after'

contains

  subroutine write_binned_heights(binnedHeights, name)
    type(BinnedHeight), intent(in):: binnedheights(:)
    character(len = *), intent(in), optional:: name

    character(len = *), parameter:: NAME_DEFAULT = OUTPUT_DIR // '/' // 'binned_heights'
    integer:: io, i

    call new_unit(io)
    if(present(name))then
      call mkdir_p(s(name))
      open(io, file = s(name) // '/' // 'x_y.dat', status = 'replace', action = 'write')
    else
      call mkdir_p(s(NAME_DEFAULT))
      open(io, file = s(NAME_DEFAULT) // '/' // 'x_y.dat', status = 'replace', action = 'write')
    end if
    do i = 1, size(binnedHeights, 1)
      write(io, *) binnedHeights(i)%xCenter, binnedHeights(i)%height
    end do
    close(io)

    call new_unit(io)
    if(present(name))then
      open(io, file = s(name) // '/' // 'width.dat', status = 'replace', action = 'write')
    else
      open(io, file = s(NAME_DEFAULT) // '/' // 'width.dat', status = 'replace', action = 'write')
    end if
    write(io, *) binnedHeights(1)%width
    close(io)
  end subroutine write_binned_heights

  subroutine write_circular_elements_file(xc, yc, rc, nset, file)
    real, intent(in):: xc(:, :), yc(:, :), rc(:, :)
    integer, intent(in):: nset(:)
    character(len = *), intent(in), optional:: file

    character(len = *), parameter:: FILE_DEFAULT = OUTPUT_DIR // '/' // 'circular_elements.dat'
    integer:: io

    call new_unit(io)
    if(present(file))then
      open(io, file = file, status = 'replace', action = 'write')
    else
      call mkdir_p(OUTPUT_DIR)
      open(io, file = FILE_DEFAULT, status = 'replace', action = 'write')
    end if

    call write(xc, yc, rc, nset, io)

    close(io)
  end subroutine write_circular_elements_file

  subroutine write_circular_elements_io(xc, yc, rc, nset, io)
    real, intent(in):: xc(:, :), yc(:, :), rc(:, :)
    integer, intent(in):: nset(:)
    integer, intent(in):: io

    integer:: i, j

    do i = 1, size(xc, 1)
      do j = 1, nset(i)
        write(io, *) xc(i, j), yc(i, j), rc(i, j)
      end do
    end do
  end subroutine write_circular_elements_io

  ! これが、メインのルーチン
  subroutine get_binned_heights(binnedHeights, config, xMin, xMax, rc, xc, yc, nset)
    type(DisplacementAfterConfig), intent(in):: config
    real, intent(in):: xMin, xMax
    real, intent(in):: rc(:, :), xc(:, :), yc(:, :)
    integer, intent(in):: nset(:)
    type(Binnedheight), intent(out), allocatable:: binnedheights(:)

    real:: width, xLeft, xRight, height
    integer:: i, j, k

    RAISE_IF(xMax < xMin)

    allocate(binnedheights(1:config%nBins))
    width = (xMax - xMin)/config%nBins
    binnedheights%width = width
    binnedheights%height = 0

    do i = 1, config%nBins
      xLeft = width*(i - 1) + xMin
      xRight = xLeft + width
      binnedheights(i)%xCenter = (xLeft + xRight)/2

      binnedheights(i)%isIncludeLeft = .true.
      do j = 1, size(yc, 1)
        do k = 1, nset(j)
          if(xLeft <= xc(j, k) .and. xc(j, k) < xRight)then
            height =  yc(j, k) + rc(j, k)
            if(height > binnedheights(i)%height) binnedheights(i)%height = height
          end if
        end do
      end do
    end do
  end subroutine get_binned_heights

  subroutine read_config(config)
    type(DisplacementAfterConfig), intent(out):: config

    character(len = *), parameter:: FILE_DEFAULT = INPUT_DIR // '/' // 'config.nml'

    integer:: io
    namelist /displacement_after_config/ config

    call new_unit(io)
    open(unit = io, file = FILE_DEFAULT, status = 'old', action = 'read')
    read(io, nml = displacement_after_config)
    close(io)

    call validate(config)
  end subroutine read_config

  subroutine validate_config(config)
    type(DisplacementAfterConfig), intent(in):: config

    RAISE_IF(config%nBins < 1)
    RAISE_IF(config%nElementsParParticleMax < 1)
  end subroutine validate_config
end module lib_displacement_after
