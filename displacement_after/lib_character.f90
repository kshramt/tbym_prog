# 1 "lib_character.f90"
# 1 "<command-line>"
# 1 "lib_character.f90"

module lib_character
  use, intrinsic:: iso_fortran_env, only: INT8, INT16, INT32, INT64, REAL32, REAL64, REAL128

  implicit none

  private

  public:: s ! Same as String#strip method in Ruby.
  public:: str ! Convert a value to a string. The result is also stripped.
  public:: STR_LEN ! Maximum length of str.
  public:: TAB, NEW_LINE

  integer, parameter:: STR_LEN = 1024
  character, parameter:: TAB = char(9)
  character, parameter:: NEW_LINE = char(10)

    interface str
      module procedure strLogicalDim0
    end interface str

    interface str_fixed
      module procedure str_fixedLogicalDim0
    end interface str_fixed
    interface str
      module procedure strIntegerDim0Kind8
    end interface str

    interface str_fixed
      module procedure str_fixedIntegerDim0Kind8
    end interface str_fixed
    interface str
      module procedure strIntegerDim0Kind16
    end interface str

    interface str_fixed
      module procedure str_fixedIntegerDim0Kind16
    end interface str_fixed
    interface str
      module procedure strIntegerDim0Kind32
    end interface str

    interface str_fixed
      module procedure str_fixedIntegerDim0Kind32
    end interface str_fixed
    interface str
      module procedure strIntegerDim0Kind64
    end interface str

    interface str_fixed
      module procedure str_fixedIntegerDim0Kind64
    end interface str_fixed
    interface str
      module procedure strRealDim0Kind32
    end interface str

    interface str_fixed
      module procedure str_fixedRealDim0Kind32
    end interface str_fixed
    interface str
      module procedure strRealDim0Kind64
    end interface str

    interface str_fixed
      module procedure str_fixedRealDim0Kind64
    end interface str_fixed
    interface str
      module procedure strRealDim0Kind128
    end interface str

    interface str_fixed
      module procedure str_fixedRealDim0Kind128
    end interface str_fixed
    interface str
      module procedure strComplexDim0Kind32
    end interface str

    interface str_fixed
      module procedure str_fixedComplexDim0Kind32
    end interface str_fixed
    interface str
      module procedure strComplexDim0Kind64
    end interface str

    interface str_fixed
      module procedure str_fixedComplexDim0Kind64
    end interface str_fixed
    interface str
      module procedure strComplexDim0Kind128
    end interface str

    interface str_fixed
      module procedure str_fixedComplexDim0Kind128
    end interface str_fixed
    interface str
      module procedure strCharacterDim0LenAst
    end interface str

    interface str_fixed
      module procedure str_fixedCharacterDim0LenAst
    end interface str_fixed

contains

  pure function s(str) result(this)
    character(len = *), intent(in):: str
    character(len = len_trim(adjustl(str))):: this

    this = trim(adjustl(str))
  end function s

    pure function strLogicalDim0(x) result(this)
      Logical, intent(in):: x
      character(len = len(s(str_fixed(x)))):: this

      this = s(str_fixed(x))
    end function strLogicalDim0

    pure function str_fixedLogicalDim0(x) result(this)
      character(len = STR_LEN):: this
      Logical, intent(in):: x

      write(this, *) x
      this = s(this)
    end function str_fixedLogicalDim0
    pure function strIntegerDim0Kind8(x) result(this)
      Integer(INT8), intent(in):: x
      character(len = len(s(str_fixed(x)))):: this

      this = s(str_fixed(x))
    end function strIntegerDim0Kind8

    pure function str_fixedIntegerDim0Kind8(x) result(this)
      character(len = STR_LEN):: this
      Integer(INT8), intent(in):: x

      write(this, *) x
      this = s(this)
    end function str_fixedIntegerDim0Kind8
    pure function strIntegerDim0Kind16(x) result(this)
      Integer(INT16), intent(in):: x
      character(len = len(s(str_fixed(x)))):: this

      this = s(str_fixed(x))
    end function strIntegerDim0Kind16

    pure function str_fixedIntegerDim0Kind16(x) result(this)
      character(len = STR_LEN):: this
      Integer(INT16), intent(in):: x

      write(this, *) x
      this = s(this)
    end function str_fixedIntegerDim0Kind16
    pure function strIntegerDim0Kind32(x) result(this)
      Integer(INT32), intent(in):: x
      character(len = len(s(str_fixed(x)))):: this

      this = s(str_fixed(x))
    end function strIntegerDim0Kind32

    pure function str_fixedIntegerDim0Kind32(x) result(this)
      character(len = STR_LEN):: this
      Integer(INT32), intent(in):: x

      write(this, *) x
      this = s(this)
    end function str_fixedIntegerDim0Kind32
    pure function strIntegerDim0Kind64(x) result(this)
      Integer(INT64), intent(in):: x
      character(len = len(s(str_fixed(x)))):: this

      this = s(str_fixed(x))
    end function strIntegerDim0Kind64

    pure function str_fixedIntegerDim0Kind64(x) result(this)
      character(len = STR_LEN):: this
      Integer(INT64), intent(in):: x

      write(this, *) x
      this = s(this)
    end function str_fixedIntegerDim0Kind64
    pure function strRealDim0Kind32(x) result(this)
      Real(REAL32), intent(in):: x
      character(len = len(s(str_fixed(x)))):: this

      this = s(str_fixed(x))
    end function strRealDim0Kind32

    pure function str_fixedRealDim0Kind32(x) result(this)
      character(len = STR_LEN):: this
      Real(REAL32), intent(in):: x

      write(this, *) x
      this = s(this)
    end function str_fixedRealDim0Kind32
    pure function strRealDim0Kind64(x) result(this)
      Real(REAL64), intent(in):: x
      character(len = len(s(str_fixed(x)))):: this

      this = s(str_fixed(x))
    end function strRealDim0Kind64

    pure function str_fixedRealDim0Kind64(x) result(this)
      character(len = STR_LEN):: this
      Real(REAL64), intent(in):: x

      write(this, *) x
      this = s(this)
    end function str_fixedRealDim0Kind64
    pure function strRealDim0Kind128(x) result(this)
      Real(REAL128), intent(in):: x
      character(len = len(s(str_fixed(x)))):: this

      this = s(str_fixed(x))
    end function strRealDim0Kind128

    pure function str_fixedRealDim0Kind128(x) result(this)
      character(len = STR_LEN):: this
      Real(REAL128), intent(in):: x

      write(this, *) x
      this = s(this)
    end function str_fixedRealDim0Kind128
    pure function strComplexDim0Kind32(x) result(this)
      Complex(REAL32), intent(in):: x
      character(len = len(s(str_fixed(x)))):: this

      this = s(str_fixed(x))
    end function strComplexDim0Kind32

    pure function str_fixedComplexDim0Kind32(x) result(this)
      character(len = STR_LEN):: this
      Complex(REAL32), intent(in):: x

      write(this, *) x
      this = s(this)
    end function str_fixedComplexDim0Kind32
    pure function strComplexDim0Kind64(x) result(this)
      Complex(REAL64), intent(in):: x
      character(len = len(s(str_fixed(x)))):: this

      this = s(str_fixed(x))
    end function strComplexDim0Kind64

    pure function str_fixedComplexDim0Kind64(x) result(this)
      character(len = STR_LEN):: this
      Complex(REAL64), intent(in):: x

      write(this, *) x
      this = s(this)
    end function str_fixedComplexDim0Kind64
    pure function strComplexDim0Kind128(x) result(this)
      Complex(REAL128), intent(in):: x
      character(len = len(s(str_fixed(x)))):: this

      this = s(str_fixed(x))
    end function strComplexDim0Kind128

    pure function str_fixedComplexDim0Kind128(x) result(this)
      character(len = STR_LEN):: this
      Complex(REAL128), intent(in):: x

      write(this, *) x
      this = s(this)
    end function str_fixedComplexDim0Kind128
    pure function strCharacterDim0LenAst(x) result(this)
      Character(len = *), intent(in):: x
      character(len = len(s(str_fixed(x)))):: this

      this = s(str_fixed(x))
    end function strCharacterDim0LenAst

    pure function str_fixedCharacterDim0LenAst(x) result(this)
      character(len = STR_LEN):: this
      Character(len = *), intent(in):: x

      write(this, *) x
      this = s(this)
    end function str_fixedCharacterDim0LenAst
end module lib_character
