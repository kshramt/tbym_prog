# 1 "lib_io.f90"
# 1 "<command-line>"
# 1 "lib_io.f90"


# 1 "utils.h" 1
# 4 "lib_io.f90" 2
module lib_io
  use, intrinsic:: iso_fortran_env, only: ERROR_UNIT, INPUT_UNIT, OUTPUT_UNIT
  use, intrinsic:: iso_fortran_env, only: INT8, INT16, INT32, INT64, REAL32, REAL64, REAL128
  use lib_character, only: TAB, s

  implicit none

  private
  public:: VERSION, ARRAY_DATA_FILE, ARRAY_META_FILE, ARRAY_VERSION_FILE, ARRAY_DESCRIPTION_FILE
  public:: TMP_DIR
  public:: SHELL_INTERFACE_FILE
  public:: new_unit
  public:: write_array, read_array
  public:: number_of_lines, number_of_columns, file_shape
  public:: mkdir_p
  public:: tempfile
  public:: close_tempfile
  public:: init_shell_interface_file
  public:: read_shell_interface_file

  integer, parameter:: VERSION = 1 ! Array file format's compatibility.
  integer, parameter:: NEW_UNIT_MIN = max(ERROR_UNIT, INPUT_UNIT, OUTPUT_UNIT, 0) + 1 ! 0 is decraled to handle a case where *_UNIT <= -1.
  integer, parameter:: NEW_UNIT_MAX = huge(0)
  character(len = *), parameter:: ARRAY_DATA_FILE = 'data.bin'
  character(len = *), parameter:: ARRAY_META_FILE = 'meta.nml'
  character(len = *), parameter:: ARRAY_VERSION_FILE = 'version.dat'
  character(len = *), parameter:: ARRAY_DESCRIPTION_FILE = 'description.txt'
  character(len = *), parameter:: TMP_DIR = 'tmp'
  character(len = *), parameter:: SHELL_INTERFACE_FILE = TMP_DIR // '/' // 'shell_interface.dat'

  interface new_unit
      module procedure new_unitIntegerDim0Kind8
      module procedure new_unitIntegerDim0Kind16
      module procedure new_unitIntegerDim0Kind32
      module procedure new_unitIntegerDim0Kind64
  end interface new_unit

    interface write_array
      module procedure write_arrayLogicalDim1
    end interface write_array

    interface read_array
      module procedure read_arrayLogicalDim1
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1LogicalDim1
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayLogicalDim2
    end interface write_array

    interface read_array
      module procedure read_arrayLogicalDim2
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1LogicalDim2
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayLogicalDim3
    end interface write_array

    interface read_array
      module procedure read_arrayLogicalDim3
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1LogicalDim3
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayLogicalDim4
    end interface write_array

    interface read_array
      module procedure read_arrayLogicalDim4
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1LogicalDim4
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayLogicalDim5
    end interface write_array

    interface read_array
      module procedure read_arrayLogicalDim5
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1LogicalDim5
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayLogicalDim6
    end interface write_array

    interface read_array
      module procedure read_arrayLogicalDim6
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1LogicalDim6
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayLogicalDim7
    end interface write_array

    interface read_array
      module procedure read_arrayLogicalDim7
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1LogicalDim7
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayIntegerDim1Kind8
    end interface write_array

    interface read_array
      module procedure read_arrayIntegerDim1Kind8
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1IntegerDim1Kind8
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayIntegerDim1Kind16
    end interface write_array

    interface read_array
      module procedure read_arrayIntegerDim1Kind16
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1IntegerDim1Kind16
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayIntegerDim1Kind32
    end interface write_array

    interface read_array
      module procedure read_arrayIntegerDim1Kind32
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1IntegerDim1Kind32
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayIntegerDim1Kind64
    end interface write_array

    interface read_array
      module procedure read_arrayIntegerDim1Kind64
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1IntegerDim1Kind64
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayIntegerDim2Kind8
    end interface write_array

    interface read_array
      module procedure read_arrayIntegerDim2Kind8
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1IntegerDim2Kind8
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayIntegerDim2Kind16
    end interface write_array

    interface read_array
      module procedure read_arrayIntegerDim2Kind16
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1IntegerDim2Kind16
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayIntegerDim2Kind32
    end interface write_array

    interface read_array
      module procedure read_arrayIntegerDim2Kind32
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1IntegerDim2Kind32
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayIntegerDim2Kind64
    end interface write_array

    interface read_array
      module procedure read_arrayIntegerDim2Kind64
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1IntegerDim2Kind64
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayIntegerDim3Kind8
    end interface write_array

    interface read_array
      module procedure read_arrayIntegerDim3Kind8
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1IntegerDim3Kind8
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayIntegerDim3Kind16
    end interface write_array

    interface read_array
      module procedure read_arrayIntegerDim3Kind16
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1IntegerDim3Kind16
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayIntegerDim3Kind32
    end interface write_array

    interface read_array
      module procedure read_arrayIntegerDim3Kind32
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1IntegerDim3Kind32
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayIntegerDim3Kind64
    end interface write_array

    interface read_array
      module procedure read_arrayIntegerDim3Kind64
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1IntegerDim3Kind64
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayIntegerDim4Kind8
    end interface write_array

    interface read_array
      module procedure read_arrayIntegerDim4Kind8
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1IntegerDim4Kind8
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayIntegerDim4Kind16
    end interface write_array

    interface read_array
      module procedure read_arrayIntegerDim4Kind16
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1IntegerDim4Kind16
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayIntegerDim4Kind32
    end interface write_array

    interface read_array
      module procedure read_arrayIntegerDim4Kind32
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1IntegerDim4Kind32
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayIntegerDim4Kind64
    end interface write_array

    interface read_array
      module procedure read_arrayIntegerDim4Kind64
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1IntegerDim4Kind64
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayIntegerDim5Kind8
    end interface write_array

    interface read_array
      module procedure read_arrayIntegerDim5Kind8
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1IntegerDim5Kind8
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayIntegerDim5Kind16
    end interface write_array

    interface read_array
      module procedure read_arrayIntegerDim5Kind16
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1IntegerDim5Kind16
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayIntegerDim5Kind32
    end interface write_array

    interface read_array
      module procedure read_arrayIntegerDim5Kind32
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1IntegerDim5Kind32
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayIntegerDim5Kind64
    end interface write_array

    interface read_array
      module procedure read_arrayIntegerDim5Kind64
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1IntegerDim5Kind64
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayIntegerDim6Kind8
    end interface write_array

    interface read_array
      module procedure read_arrayIntegerDim6Kind8
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1IntegerDim6Kind8
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayIntegerDim6Kind16
    end interface write_array

    interface read_array
      module procedure read_arrayIntegerDim6Kind16
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1IntegerDim6Kind16
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayIntegerDim6Kind32
    end interface write_array

    interface read_array
      module procedure read_arrayIntegerDim6Kind32
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1IntegerDim6Kind32
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayIntegerDim6Kind64
    end interface write_array

    interface read_array
      module procedure read_arrayIntegerDim6Kind64
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1IntegerDim6Kind64
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayIntegerDim7Kind8
    end interface write_array

    interface read_array
      module procedure read_arrayIntegerDim7Kind8
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1IntegerDim7Kind8
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayIntegerDim7Kind16
    end interface write_array

    interface read_array
      module procedure read_arrayIntegerDim7Kind16
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1IntegerDim7Kind16
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayIntegerDim7Kind32
    end interface write_array

    interface read_array
      module procedure read_arrayIntegerDim7Kind32
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1IntegerDim7Kind32
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayIntegerDim7Kind64
    end interface write_array

    interface read_array
      module procedure read_arrayIntegerDim7Kind64
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1IntegerDim7Kind64
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayRealDim1Kind32
    end interface write_array

    interface read_array
      module procedure read_arrayRealDim1Kind32
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1RealDim1Kind32
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayRealDim1Kind64
    end interface write_array

    interface read_array
      module procedure read_arrayRealDim1Kind64
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1RealDim1Kind64
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayRealDim1Kind128
    end interface write_array

    interface read_array
      module procedure read_arrayRealDim1Kind128
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1RealDim1Kind128
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayRealDim2Kind32
    end interface write_array

    interface read_array
      module procedure read_arrayRealDim2Kind32
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1RealDim2Kind32
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayRealDim2Kind64
    end interface write_array

    interface read_array
      module procedure read_arrayRealDim2Kind64
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1RealDim2Kind64
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayRealDim2Kind128
    end interface write_array

    interface read_array
      module procedure read_arrayRealDim2Kind128
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1RealDim2Kind128
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayRealDim3Kind32
    end interface write_array

    interface read_array
      module procedure read_arrayRealDim3Kind32
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1RealDim3Kind32
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayRealDim3Kind64
    end interface write_array

    interface read_array
      module procedure read_arrayRealDim3Kind64
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1RealDim3Kind64
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayRealDim3Kind128
    end interface write_array

    interface read_array
      module procedure read_arrayRealDim3Kind128
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1RealDim3Kind128
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayRealDim4Kind32
    end interface write_array

    interface read_array
      module procedure read_arrayRealDim4Kind32
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1RealDim4Kind32
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayRealDim4Kind64
    end interface write_array

    interface read_array
      module procedure read_arrayRealDim4Kind64
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1RealDim4Kind64
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayRealDim4Kind128
    end interface write_array

    interface read_array
      module procedure read_arrayRealDim4Kind128
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1RealDim4Kind128
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayRealDim5Kind32
    end interface write_array

    interface read_array
      module procedure read_arrayRealDim5Kind32
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1RealDim5Kind32
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayRealDim5Kind64
    end interface write_array

    interface read_array
      module procedure read_arrayRealDim5Kind64
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1RealDim5Kind64
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayRealDim5Kind128
    end interface write_array

    interface read_array
      module procedure read_arrayRealDim5Kind128
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1RealDim5Kind128
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayRealDim6Kind32
    end interface write_array

    interface read_array
      module procedure read_arrayRealDim6Kind32
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1RealDim6Kind32
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayRealDim6Kind64
    end interface write_array

    interface read_array
      module procedure read_arrayRealDim6Kind64
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1RealDim6Kind64
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayRealDim6Kind128
    end interface write_array

    interface read_array
      module procedure read_arrayRealDim6Kind128
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1RealDim6Kind128
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayRealDim7Kind32
    end interface write_array

    interface read_array
      module procedure read_arrayRealDim7Kind32
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1RealDim7Kind32
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayRealDim7Kind64
    end interface write_array

    interface read_array
      module procedure read_arrayRealDim7Kind64
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1RealDim7Kind64
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayRealDim7Kind128
    end interface write_array

    interface read_array
      module procedure read_arrayRealDim7Kind128
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1RealDim7Kind128
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayComplexDim1Kind32
    end interface write_array

    interface read_array
      module procedure read_arrayComplexDim1Kind32
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1ComplexDim1Kind32
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayComplexDim1Kind64
    end interface write_array

    interface read_array
      module procedure read_arrayComplexDim1Kind64
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1ComplexDim1Kind64
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayComplexDim1Kind128
    end interface write_array

    interface read_array
      module procedure read_arrayComplexDim1Kind128
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1ComplexDim1Kind128
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayComplexDim2Kind32
    end interface write_array

    interface read_array
      module procedure read_arrayComplexDim2Kind32
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1ComplexDim2Kind32
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayComplexDim2Kind64
    end interface write_array

    interface read_array
      module procedure read_arrayComplexDim2Kind64
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1ComplexDim2Kind64
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayComplexDim2Kind128
    end interface write_array

    interface read_array
      module procedure read_arrayComplexDim2Kind128
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1ComplexDim2Kind128
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayComplexDim3Kind32
    end interface write_array

    interface read_array
      module procedure read_arrayComplexDim3Kind32
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1ComplexDim3Kind32
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayComplexDim3Kind64
    end interface write_array

    interface read_array
      module procedure read_arrayComplexDim3Kind64
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1ComplexDim3Kind64
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayComplexDim3Kind128
    end interface write_array

    interface read_array
      module procedure read_arrayComplexDim3Kind128
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1ComplexDim3Kind128
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayComplexDim4Kind32
    end interface write_array

    interface read_array
      module procedure read_arrayComplexDim4Kind32
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1ComplexDim4Kind32
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayComplexDim4Kind64
    end interface write_array

    interface read_array
      module procedure read_arrayComplexDim4Kind64
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1ComplexDim4Kind64
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayComplexDim4Kind128
    end interface write_array

    interface read_array
      module procedure read_arrayComplexDim4Kind128
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1ComplexDim4Kind128
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayComplexDim5Kind32
    end interface write_array

    interface read_array
      module procedure read_arrayComplexDim5Kind32
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1ComplexDim5Kind32
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayComplexDim5Kind64
    end interface write_array

    interface read_array
      module procedure read_arrayComplexDim5Kind64
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1ComplexDim5Kind64
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayComplexDim5Kind128
    end interface write_array

    interface read_array
      module procedure read_arrayComplexDim5Kind128
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1ComplexDim5Kind128
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayComplexDim6Kind32
    end interface write_array

    interface read_array
      module procedure read_arrayComplexDim6Kind32
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1ComplexDim6Kind32
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayComplexDim6Kind64
    end interface write_array

    interface read_array
      module procedure read_arrayComplexDim6Kind64
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1ComplexDim6Kind64
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayComplexDim6Kind128
    end interface write_array

    interface read_array
      module procedure read_arrayComplexDim6Kind128
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1ComplexDim6Kind128
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayComplexDim7Kind32
    end interface write_array

    interface read_array
      module procedure read_arrayComplexDim7Kind32
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1ComplexDim7Kind32
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayComplexDim7Kind64
    end interface write_array

    interface read_array
      module procedure read_arrayComplexDim7Kind64
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1ComplexDim7Kind64
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayComplexDim7Kind128
    end interface write_array

    interface read_array
      module procedure read_arrayComplexDim7Kind128
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1ComplexDim7Kind128
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayCharacterDim1LenAst
    end interface write_array

    interface read_array
      module procedure read_arrayCharacterDim1LenAst
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1CharacterDim1LenAst
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayCharacterDim2LenAst
    end interface write_array

    interface read_array
      module procedure read_arrayCharacterDim2LenAst
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1CharacterDim2LenAst
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayCharacterDim3LenAst
    end interface write_array

    interface read_array
      module procedure read_arrayCharacterDim3LenAst
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1CharacterDim3LenAst
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayCharacterDim4LenAst
    end interface write_array

    interface read_array
      module procedure read_arrayCharacterDim4LenAst
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1CharacterDim4LenAst
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayCharacterDim5LenAst
    end interface write_array

    interface read_array
      module procedure read_arrayCharacterDim5LenAst
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1CharacterDim5LenAst
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayCharacterDim6LenAst
    end interface write_array

    interface read_array
      module procedure read_arrayCharacterDim6LenAst
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1CharacterDim6LenAst
    end interface read_array_v_1
    interface write_array
      module procedure write_arrayCharacterDim7LenAst
    end interface write_array

    interface read_array
      module procedure read_arrayCharacterDim7LenAst
    end interface read_array

    interface read_array_v_1
      module procedure read_array_v_1CharacterDim7LenAst
    end interface read_array_v_1

contains

  subroutine init_shell_interface_file()
    call mkdir_p(TMP_DIR)
    call execute_command_line("cat /dev/null > " // SHELL_INTERFACE_FILE)
  end subroutine init_shell_interface_file

  ! YAGNI: this can easily expand to val for r, R, i, I, z, Z, and l.
  subroutine read_shell_interface_file(val)
    character(len = *), intent(out):: val

    integer:: ioU

    call new_unit(ioU)
    open(ioU, file = SHELL_INTERFACE_FILE, status = 'old', action = 'read')
    read(ioU, *) val
    close(ioU)
  end subroutine read_shell_interface_file

  subroutine tempfile(ioU, file)
    integer, intent(out):: ioU
    character(len = *), intent(out):: file

    call init_shell_interface_file()
    ! tempfile name must be quoted since '/' mark is regarded to be end of record (same as namelist).
    call execute_command_line('echo \"$(tempfile)\" > ' // SHELL_INTERFACE_FILE)
    call read_shell_interface_file(file)
    call new_unit(ioU)
    open(ioU, file = s(file), status = 'old', action = 'readwrite')
  end subroutine tempfile

  subroutine close_tempfile(ioU)
    integer, intent(in):: ioU

    close(ioU, status = 'delete')
  end subroutine close_tempfile

  subroutine mkdir_p(path, exitStatus)
    character(len = *) path
    integer, intent(out), optional:: exitStatus
    integer:: exitStatus_
    call execute_command_line("mkdir -p " // s(path), exitstat = exitStatus_)

    if(present(exitStatus))then
      exitStatus = exitStatus_
    elseif(exitStatus_ /= 0)then
      write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 1012,'Failed to execute mkdir -p ', s(path); stop 1
    end if
  end subroutine mkdir_p

  ! @desc Return a size 2 array which contains (/numberOfLines, numberOfColumns/) of the file fileName.
  function file_shape(fileName, numberOfHeaders) result(this)
    integer(8):: this(1:2)
    character(len = *), intent(in):: fileName
    integer, intent(in), optional:: numberOfHeaders

    integer:: numberOfHeaders_

    numberOfHeaders_ = 0
    if(present(numberOfHeaders)) numberOfHeaders_ = numberOfHeaders

    this = (/number_of_lines(fileName) - numberOfHeaders_, number_of_columns(fileName, numberOfHeaders_)/)
  end function file_shape

  function number_of_lines(fileName) result(this)
    integer(8):: this
    character(len = *), intent(in):: fileName

    integer:: rU1, ios
    character:: dummy

    call new_unit(rU1)
    open(rU1, file = fileName, status = 'old', action = 'read', delim = 'quote')
    do this = 0, huge(this)
      read(rU1, *, iostat = ios) dummy
      if(ios /= 0) exit
    end do
    close(rU1)
  end function number_of_lines

  ! @desc Return number of columns at line (numberOfHeaders + 1) in file fileName.
  ! @desc The line is separated by space and tabs character.
  ! @desc Quoted string containing space/tab characteres is not considared.
  function number_of_columns(fileName, numberOfHeaders) result(this)
    integer(8):: this
    character(len = *), intent(in):: fileName
    integer, intent(in), optional:: numberOfHeaders

    enum, bind(c)
      enumerator:: SEEK_NORMAL_CHAR, SEEK_SPACE_OR_TAB
    end enum
    integer:: rU1, ios, i, mode
    character:: c

    integer:: numberOfHeaders_

    numberOfHeaders_ = 0
    if(present(numberOfHeaders)) numberOfHeaders_ = numberOfHeaders

    mode = SEEK_NORMAL_CHAR
    this = 0
    call new_unit(rU1)
    open(rU1, file = fileName, status = 'old', action = 'read', delim = 'quote')
    do i = 1, numberOfHeaders_
      read(rU1, *)
    end do
    do
      read(rU1, '(a1)', advance = 'no', iostat = ios) c
      if(ios /= 0 .or. c == new_line('_'))then
        exit
      else if(mode == SEEK_NORMAL_CHAR .and. c /= ' ' .and. c /= TAB)then
        this = this + 1
        mode = SEEK_SPACE_OR_TAB
        cycle
      else if(mode == SEEK_SPACE_OR_TAB .and. (c == ' ' .or. c == TAB))then
        mode = SEEK_NORMAL_CHAR
        cycle
      else
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 1084,'Must not happen.'; stop 1
      end if
    end do
    close(rU1)
  end function number_of_columns

    subroutine write_arrayLogicalDim1(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Logical, dimension(:), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'LogicalDim1'
      integer, parameter:: DIM_FOR_SELF = 1

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayLogicalDim1

    subroutine read_arrayLogicalDim1(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Logical, dimension(:), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 1155,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayLogicalDim1

    subroutine read_array_v_1LogicalDim1(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Logical, dimension(:), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'LogicalDim1'
      integer, parameter:: DIM_FOR_SELF = 1
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 1175,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 1176,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1LogicalDim1
    subroutine write_arrayLogicalDim2(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Logical, dimension(:, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'LogicalDim2'
      integer, parameter:: DIM_FOR_SELF = 2

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayLogicalDim2

    subroutine read_arrayLogicalDim2(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Logical, dimension(:, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 1251,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayLogicalDim2

    subroutine read_array_v_1LogicalDim2(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Logical, dimension(:, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'LogicalDim2'
      integer, parameter:: DIM_FOR_SELF = 2
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 1271,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 1272,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1LogicalDim2
    subroutine write_arrayLogicalDim3(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Logical, dimension(:, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'LogicalDim3'
      integer, parameter:: DIM_FOR_SELF = 3

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayLogicalDim3

    subroutine read_arrayLogicalDim3(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Logical, dimension(:, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 1347,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayLogicalDim3

    subroutine read_array_v_1LogicalDim3(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Logical, dimension(:, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'LogicalDim3'
      integer, parameter:: DIM_FOR_SELF = 3
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 1367,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 1368,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1LogicalDim3
    subroutine write_arrayLogicalDim4(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Logical, dimension(:, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'LogicalDim4'
      integer, parameter:: DIM_FOR_SELF = 4

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayLogicalDim4

    subroutine read_arrayLogicalDim4(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Logical, dimension(:, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 1443,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayLogicalDim4

    subroutine read_array_v_1LogicalDim4(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Logical, dimension(:, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'LogicalDim4'
      integer, parameter:: DIM_FOR_SELF = 4
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 1463,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 1464,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1LogicalDim4
    subroutine write_arrayLogicalDim5(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Logical, dimension(:, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'LogicalDim5'
      integer, parameter:: DIM_FOR_SELF = 5

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayLogicalDim5

    subroutine read_arrayLogicalDim5(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Logical, dimension(:, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 1539,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayLogicalDim5

    subroutine read_array_v_1LogicalDim5(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Logical, dimension(:, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'LogicalDim5'
      integer, parameter:: DIM_FOR_SELF = 5
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 1559,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 1560,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1LogicalDim5
    subroutine write_arrayLogicalDim6(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Logical, dimension(:, :, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'LogicalDim6'
      integer, parameter:: DIM_FOR_SELF = 6

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayLogicalDim6

    subroutine read_arrayLogicalDim6(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Logical, dimension(:, :, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 1635,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayLogicalDim6

    subroutine read_array_v_1LogicalDim6(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Logical, dimension(:, :, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'LogicalDim6'
      integer, parameter:: DIM_FOR_SELF = 6
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 1655,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 1656,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5), 1:sizes(6)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1LogicalDim6
    subroutine write_arrayLogicalDim7(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Logical, dimension(:, :, :, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'LogicalDim7'
      integer, parameter:: DIM_FOR_SELF = 7

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayLogicalDim7

    subroutine read_arrayLogicalDim7(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Logical, dimension(:, :, :, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 1731,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayLogicalDim7

    subroutine read_array_v_1LogicalDim7(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Logical, dimension(:, :, :, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'LogicalDim7'
      integer, parameter:: DIM_FOR_SELF = 7
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 1751,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 1752,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5), 1:sizes(6), 1:sizes(7)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1LogicalDim7
    subroutine write_arrayIntegerDim1Kind8(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Integer(INT8), dimension(:), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim1Kind8'
      integer, parameter:: DIM_FOR_SELF = 1

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayIntegerDim1Kind8

    subroutine read_arrayIntegerDim1Kind8(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT8), dimension(:), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 1827,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayIntegerDim1Kind8

    subroutine read_array_v_1IntegerDim1Kind8(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT8), dimension(:), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim1Kind8'
      integer, parameter:: DIM_FOR_SELF = 1
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 1847,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 1848,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1IntegerDim1Kind8
    subroutine write_arrayIntegerDim1Kind16(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Integer(INT16), dimension(:), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim1Kind16'
      integer, parameter:: DIM_FOR_SELF = 1

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayIntegerDim1Kind16

    subroutine read_arrayIntegerDim1Kind16(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT16), dimension(:), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 1923,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayIntegerDim1Kind16

    subroutine read_array_v_1IntegerDim1Kind16(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT16), dimension(:), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim1Kind16'
      integer, parameter:: DIM_FOR_SELF = 1
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 1943,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 1944,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1IntegerDim1Kind16
    subroutine write_arrayIntegerDim1Kind32(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Integer(INT32), dimension(:), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim1Kind32'
      integer, parameter:: DIM_FOR_SELF = 1

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayIntegerDim1Kind32

    subroutine read_arrayIntegerDim1Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT32), dimension(:), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2019,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayIntegerDim1Kind32

    subroutine read_array_v_1IntegerDim1Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT32), dimension(:), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim1Kind32'
      integer, parameter:: DIM_FOR_SELF = 1
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2039,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2040,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1IntegerDim1Kind32
    subroutine write_arrayIntegerDim1Kind64(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Integer(INT64), dimension(:), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim1Kind64'
      integer, parameter:: DIM_FOR_SELF = 1

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayIntegerDim1Kind64

    subroutine read_arrayIntegerDim1Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT64), dimension(:), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2115,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayIntegerDim1Kind64

    subroutine read_array_v_1IntegerDim1Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT64), dimension(:), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim1Kind64'
      integer, parameter:: DIM_FOR_SELF = 1
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2135,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2136,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1IntegerDim1Kind64
    subroutine write_arrayIntegerDim2Kind8(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Integer(INT8), dimension(:, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim2Kind8'
      integer, parameter:: DIM_FOR_SELF = 2

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayIntegerDim2Kind8

    subroutine read_arrayIntegerDim2Kind8(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT8), dimension(:, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2211,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayIntegerDim2Kind8

    subroutine read_array_v_1IntegerDim2Kind8(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT8), dimension(:, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim2Kind8'
      integer, parameter:: DIM_FOR_SELF = 2
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2231,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2232,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1IntegerDim2Kind8
    subroutine write_arrayIntegerDim2Kind16(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Integer(INT16), dimension(:, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim2Kind16'
      integer, parameter:: DIM_FOR_SELF = 2

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayIntegerDim2Kind16

    subroutine read_arrayIntegerDim2Kind16(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT16), dimension(:, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2307,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayIntegerDim2Kind16

    subroutine read_array_v_1IntegerDim2Kind16(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT16), dimension(:, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim2Kind16'
      integer, parameter:: DIM_FOR_SELF = 2
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2327,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2328,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1IntegerDim2Kind16
    subroutine write_arrayIntegerDim2Kind32(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Integer(INT32), dimension(:, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim2Kind32'
      integer, parameter:: DIM_FOR_SELF = 2

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayIntegerDim2Kind32

    subroutine read_arrayIntegerDim2Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT32), dimension(:, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2403,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayIntegerDim2Kind32

    subroutine read_array_v_1IntegerDim2Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT32), dimension(:, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim2Kind32'
      integer, parameter:: DIM_FOR_SELF = 2
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2423,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2424,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1IntegerDim2Kind32
    subroutine write_arrayIntegerDim2Kind64(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Integer(INT64), dimension(:, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim2Kind64'
      integer, parameter:: DIM_FOR_SELF = 2

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayIntegerDim2Kind64

    subroutine read_arrayIntegerDim2Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT64), dimension(:, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2499,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayIntegerDim2Kind64

    subroutine read_array_v_1IntegerDim2Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT64), dimension(:, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim2Kind64'
      integer, parameter:: DIM_FOR_SELF = 2
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2519,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2520,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1IntegerDim2Kind64
    subroutine write_arrayIntegerDim3Kind8(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Integer(INT8), dimension(:, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim3Kind8'
      integer, parameter:: DIM_FOR_SELF = 3

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayIntegerDim3Kind8

    subroutine read_arrayIntegerDim3Kind8(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT8), dimension(:, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2595,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayIntegerDim3Kind8

    subroutine read_array_v_1IntegerDim3Kind8(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT8), dimension(:, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim3Kind8'
      integer, parameter:: DIM_FOR_SELF = 3
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2615,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2616,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1IntegerDim3Kind8
    subroutine write_arrayIntegerDim3Kind16(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Integer(INT16), dimension(:, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim3Kind16'
      integer, parameter:: DIM_FOR_SELF = 3

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayIntegerDim3Kind16

    subroutine read_arrayIntegerDim3Kind16(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT16), dimension(:, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2691,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayIntegerDim3Kind16

    subroutine read_array_v_1IntegerDim3Kind16(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT16), dimension(:, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim3Kind16'
      integer, parameter:: DIM_FOR_SELF = 3
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2711,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2712,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1IntegerDim3Kind16
    subroutine write_arrayIntegerDim3Kind32(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Integer(INT32), dimension(:, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim3Kind32'
      integer, parameter:: DIM_FOR_SELF = 3

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayIntegerDim3Kind32

    subroutine read_arrayIntegerDim3Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT32), dimension(:, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2787,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayIntegerDim3Kind32

    subroutine read_array_v_1IntegerDim3Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT32), dimension(:, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim3Kind32'
      integer, parameter:: DIM_FOR_SELF = 3
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2807,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2808,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1IntegerDim3Kind32
    subroutine write_arrayIntegerDim3Kind64(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Integer(INT64), dimension(:, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim3Kind64'
      integer, parameter:: DIM_FOR_SELF = 3

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayIntegerDim3Kind64

    subroutine read_arrayIntegerDim3Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT64), dimension(:, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2883,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayIntegerDim3Kind64

    subroutine read_array_v_1IntegerDim3Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT64), dimension(:, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim3Kind64'
      integer, parameter:: DIM_FOR_SELF = 3
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2903,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2904,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1IntegerDim3Kind64
    subroutine write_arrayIntegerDim4Kind8(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Integer(INT8), dimension(:, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim4Kind8'
      integer, parameter:: DIM_FOR_SELF = 4

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayIntegerDim4Kind8

    subroutine read_arrayIntegerDim4Kind8(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT8), dimension(:, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2979,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayIntegerDim4Kind8

    subroutine read_array_v_1IntegerDim4Kind8(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT8), dimension(:, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim4Kind8'
      integer, parameter:: DIM_FOR_SELF = 4
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 2999,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3000,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1IntegerDim4Kind8
    subroutine write_arrayIntegerDim4Kind16(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Integer(INT16), dimension(:, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim4Kind16'
      integer, parameter:: DIM_FOR_SELF = 4

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayIntegerDim4Kind16

    subroutine read_arrayIntegerDim4Kind16(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT16), dimension(:, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3075,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayIntegerDim4Kind16

    subroutine read_array_v_1IntegerDim4Kind16(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT16), dimension(:, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim4Kind16'
      integer, parameter:: DIM_FOR_SELF = 4
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3095,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3096,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1IntegerDim4Kind16
    subroutine write_arrayIntegerDim4Kind32(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Integer(INT32), dimension(:, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim4Kind32'
      integer, parameter:: DIM_FOR_SELF = 4

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayIntegerDim4Kind32

    subroutine read_arrayIntegerDim4Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT32), dimension(:, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3171,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayIntegerDim4Kind32

    subroutine read_array_v_1IntegerDim4Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT32), dimension(:, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim4Kind32'
      integer, parameter:: DIM_FOR_SELF = 4
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3191,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3192,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1IntegerDim4Kind32
    subroutine write_arrayIntegerDim4Kind64(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Integer(INT64), dimension(:, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim4Kind64'
      integer, parameter:: DIM_FOR_SELF = 4

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayIntegerDim4Kind64

    subroutine read_arrayIntegerDim4Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT64), dimension(:, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3267,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayIntegerDim4Kind64

    subroutine read_array_v_1IntegerDim4Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT64), dimension(:, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim4Kind64'
      integer, parameter:: DIM_FOR_SELF = 4
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3287,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3288,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1IntegerDim4Kind64
    subroutine write_arrayIntegerDim5Kind8(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Integer(INT8), dimension(:, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim5Kind8'
      integer, parameter:: DIM_FOR_SELF = 5

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayIntegerDim5Kind8

    subroutine read_arrayIntegerDim5Kind8(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT8), dimension(:, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3363,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayIntegerDim5Kind8

    subroutine read_array_v_1IntegerDim5Kind8(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT8), dimension(:, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim5Kind8'
      integer, parameter:: DIM_FOR_SELF = 5
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3383,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3384,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1IntegerDim5Kind8
    subroutine write_arrayIntegerDim5Kind16(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Integer(INT16), dimension(:, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim5Kind16'
      integer, parameter:: DIM_FOR_SELF = 5

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayIntegerDim5Kind16

    subroutine read_arrayIntegerDim5Kind16(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT16), dimension(:, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3459,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayIntegerDim5Kind16

    subroutine read_array_v_1IntegerDim5Kind16(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT16), dimension(:, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim5Kind16'
      integer, parameter:: DIM_FOR_SELF = 5
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3479,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3480,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1IntegerDim5Kind16
    subroutine write_arrayIntegerDim5Kind32(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Integer(INT32), dimension(:, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim5Kind32'
      integer, parameter:: DIM_FOR_SELF = 5

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayIntegerDim5Kind32

    subroutine read_arrayIntegerDim5Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT32), dimension(:, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3555,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayIntegerDim5Kind32

    subroutine read_array_v_1IntegerDim5Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT32), dimension(:, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim5Kind32'
      integer, parameter:: DIM_FOR_SELF = 5
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3575,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3576,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1IntegerDim5Kind32
    subroutine write_arrayIntegerDim5Kind64(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Integer(INT64), dimension(:, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim5Kind64'
      integer, parameter:: DIM_FOR_SELF = 5

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayIntegerDim5Kind64

    subroutine read_arrayIntegerDim5Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT64), dimension(:, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3651,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayIntegerDim5Kind64

    subroutine read_array_v_1IntegerDim5Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT64), dimension(:, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim5Kind64'
      integer, parameter:: DIM_FOR_SELF = 5
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3671,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3672,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1IntegerDim5Kind64
    subroutine write_arrayIntegerDim6Kind8(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Integer(INT8), dimension(:, :, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim6Kind8'
      integer, parameter:: DIM_FOR_SELF = 6

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayIntegerDim6Kind8

    subroutine read_arrayIntegerDim6Kind8(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT8), dimension(:, :, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3747,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayIntegerDim6Kind8

    subroutine read_array_v_1IntegerDim6Kind8(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT8), dimension(:, :, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim6Kind8'
      integer, parameter:: DIM_FOR_SELF = 6
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3767,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3768,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5), 1:sizes(6)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1IntegerDim6Kind8
    subroutine write_arrayIntegerDim6Kind16(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Integer(INT16), dimension(:, :, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim6Kind16'
      integer, parameter:: DIM_FOR_SELF = 6

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayIntegerDim6Kind16

    subroutine read_arrayIntegerDim6Kind16(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT16), dimension(:, :, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3843,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayIntegerDim6Kind16

    subroutine read_array_v_1IntegerDim6Kind16(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT16), dimension(:, :, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim6Kind16'
      integer, parameter:: DIM_FOR_SELF = 6
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3863,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3864,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5), 1:sizes(6)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1IntegerDim6Kind16
    subroutine write_arrayIntegerDim6Kind32(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Integer(INT32), dimension(:, :, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim6Kind32'
      integer, parameter:: DIM_FOR_SELF = 6

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayIntegerDim6Kind32

    subroutine read_arrayIntegerDim6Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT32), dimension(:, :, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3939,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayIntegerDim6Kind32

    subroutine read_array_v_1IntegerDim6Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT32), dimension(:, :, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim6Kind32'
      integer, parameter:: DIM_FOR_SELF = 6
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3959,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 3960,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5), 1:sizes(6)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1IntegerDim6Kind32
    subroutine write_arrayIntegerDim6Kind64(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Integer(INT64), dimension(:, :, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim6Kind64'
      integer, parameter:: DIM_FOR_SELF = 6

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayIntegerDim6Kind64

    subroutine read_arrayIntegerDim6Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT64), dimension(:, :, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4035,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayIntegerDim6Kind64

    subroutine read_array_v_1IntegerDim6Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT64), dimension(:, :, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim6Kind64'
      integer, parameter:: DIM_FOR_SELF = 6
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4055,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4056,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5), 1:sizes(6)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1IntegerDim6Kind64
    subroutine write_arrayIntegerDim7Kind8(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Integer(INT8), dimension(:, :, :, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim7Kind8'
      integer, parameter:: DIM_FOR_SELF = 7

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayIntegerDim7Kind8

    subroutine read_arrayIntegerDim7Kind8(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT8), dimension(:, :, :, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4131,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayIntegerDim7Kind8

    subroutine read_array_v_1IntegerDim7Kind8(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT8), dimension(:, :, :, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim7Kind8'
      integer, parameter:: DIM_FOR_SELF = 7
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4151,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4152,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5), 1:sizes(6), 1:sizes(7)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1IntegerDim7Kind8
    subroutine write_arrayIntegerDim7Kind16(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Integer(INT16), dimension(:, :, :, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim7Kind16'
      integer, parameter:: DIM_FOR_SELF = 7

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayIntegerDim7Kind16

    subroutine read_arrayIntegerDim7Kind16(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT16), dimension(:, :, :, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4227,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayIntegerDim7Kind16

    subroutine read_array_v_1IntegerDim7Kind16(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT16), dimension(:, :, :, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim7Kind16'
      integer, parameter:: DIM_FOR_SELF = 7
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4247,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4248,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5), 1:sizes(6), 1:sizes(7)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1IntegerDim7Kind16
    subroutine write_arrayIntegerDim7Kind32(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Integer(INT32), dimension(:, :, :, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim7Kind32'
      integer, parameter:: DIM_FOR_SELF = 7

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayIntegerDim7Kind32

    subroutine read_arrayIntegerDim7Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT32), dimension(:, :, :, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4323,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayIntegerDim7Kind32

    subroutine read_array_v_1IntegerDim7Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT32), dimension(:, :, :, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim7Kind32'
      integer, parameter:: DIM_FOR_SELF = 7
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4343,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4344,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5), 1:sizes(6), 1:sizes(7)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1IntegerDim7Kind32
    subroutine write_arrayIntegerDim7Kind64(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Integer(INT64), dimension(:, :, :, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim7Kind64'
      integer, parameter:: DIM_FOR_SELF = 7

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayIntegerDim7Kind64

    subroutine read_arrayIntegerDim7Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT64), dimension(:, :, :, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4419,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayIntegerDim7Kind64

    subroutine read_array_v_1IntegerDim7Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Integer(INT64), dimension(:, :, :, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'IntegerDim7Kind64'
      integer, parameter:: DIM_FOR_SELF = 7
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4439,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4440,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5), 1:sizes(6), 1:sizes(7)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1IntegerDim7Kind64
    subroutine write_arrayRealDim1Kind32(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Real(REAL32), dimension(:), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim1Kind32'
      integer, parameter:: DIM_FOR_SELF = 1

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayRealDim1Kind32

    subroutine read_arrayRealDim1Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL32), dimension(:), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4515,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayRealDim1Kind32

    subroutine read_array_v_1RealDim1Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL32), dimension(:), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim1Kind32'
      integer, parameter:: DIM_FOR_SELF = 1
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4535,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4536,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1RealDim1Kind32
    subroutine write_arrayRealDim1Kind64(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Real(REAL64), dimension(:), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim1Kind64'
      integer, parameter:: DIM_FOR_SELF = 1

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayRealDim1Kind64

    subroutine read_arrayRealDim1Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL64), dimension(:), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4611,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayRealDim1Kind64

    subroutine read_array_v_1RealDim1Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL64), dimension(:), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim1Kind64'
      integer, parameter:: DIM_FOR_SELF = 1
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4631,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4632,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1RealDim1Kind64
    subroutine write_arrayRealDim1Kind128(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Real(REAL128), dimension(:), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim1Kind128'
      integer, parameter:: DIM_FOR_SELF = 1

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayRealDim1Kind128

    subroutine read_arrayRealDim1Kind128(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL128), dimension(:), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4707,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayRealDim1Kind128

    subroutine read_array_v_1RealDim1Kind128(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL128), dimension(:), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim1Kind128'
      integer, parameter:: DIM_FOR_SELF = 1
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4727,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4728,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1RealDim1Kind128
    subroutine write_arrayRealDim2Kind32(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Real(REAL32), dimension(:, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim2Kind32'
      integer, parameter:: DIM_FOR_SELF = 2

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayRealDim2Kind32

    subroutine read_arrayRealDim2Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL32), dimension(:, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4803,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayRealDim2Kind32

    subroutine read_array_v_1RealDim2Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL32), dimension(:, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim2Kind32'
      integer, parameter:: DIM_FOR_SELF = 2
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4823,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4824,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1RealDim2Kind32
    subroutine write_arrayRealDim2Kind64(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Real(REAL64), dimension(:, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim2Kind64'
      integer, parameter:: DIM_FOR_SELF = 2

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayRealDim2Kind64

    subroutine read_arrayRealDim2Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL64), dimension(:, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4899,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayRealDim2Kind64

    subroutine read_array_v_1RealDim2Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL64), dimension(:, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim2Kind64'
      integer, parameter:: DIM_FOR_SELF = 2
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4919,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4920,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1RealDim2Kind64
    subroutine write_arrayRealDim2Kind128(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Real(REAL128), dimension(:, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim2Kind128'
      integer, parameter:: DIM_FOR_SELF = 2

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayRealDim2Kind128

    subroutine read_arrayRealDim2Kind128(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL128), dimension(:, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 4995,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayRealDim2Kind128

    subroutine read_array_v_1RealDim2Kind128(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL128), dimension(:, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim2Kind128'
      integer, parameter:: DIM_FOR_SELF = 2
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5015,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5016,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1RealDim2Kind128
    subroutine write_arrayRealDim3Kind32(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Real(REAL32), dimension(:, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim3Kind32'
      integer, parameter:: DIM_FOR_SELF = 3

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayRealDim3Kind32

    subroutine read_arrayRealDim3Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL32), dimension(:, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5091,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayRealDim3Kind32

    subroutine read_array_v_1RealDim3Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL32), dimension(:, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim3Kind32'
      integer, parameter:: DIM_FOR_SELF = 3
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5111,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5112,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1RealDim3Kind32
    subroutine write_arrayRealDim3Kind64(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Real(REAL64), dimension(:, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim3Kind64'
      integer, parameter:: DIM_FOR_SELF = 3

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayRealDim3Kind64

    subroutine read_arrayRealDim3Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL64), dimension(:, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5187,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayRealDim3Kind64

    subroutine read_array_v_1RealDim3Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL64), dimension(:, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim3Kind64'
      integer, parameter:: DIM_FOR_SELF = 3
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5207,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5208,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1RealDim3Kind64
    subroutine write_arrayRealDim3Kind128(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Real(REAL128), dimension(:, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim3Kind128'
      integer, parameter:: DIM_FOR_SELF = 3

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayRealDim3Kind128

    subroutine read_arrayRealDim3Kind128(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL128), dimension(:, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5283,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayRealDim3Kind128

    subroutine read_array_v_1RealDim3Kind128(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL128), dimension(:, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim3Kind128'
      integer, parameter:: DIM_FOR_SELF = 3
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5303,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5304,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1RealDim3Kind128
    subroutine write_arrayRealDim4Kind32(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Real(REAL32), dimension(:, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim4Kind32'
      integer, parameter:: DIM_FOR_SELF = 4

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayRealDim4Kind32

    subroutine read_arrayRealDim4Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL32), dimension(:, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5379,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayRealDim4Kind32

    subroutine read_array_v_1RealDim4Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL32), dimension(:, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim4Kind32'
      integer, parameter:: DIM_FOR_SELF = 4
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5399,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5400,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1RealDim4Kind32
    subroutine write_arrayRealDim4Kind64(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Real(REAL64), dimension(:, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim4Kind64'
      integer, parameter:: DIM_FOR_SELF = 4

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayRealDim4Kind64

    subroutine read_arrayRealDim4Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL64), dimension(:, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5475,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayRealDim4Kind64

    subroutine read_array_v_1RealDim4Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL64), dimension(:, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim4Kind64'
      integer, parameter:: DIM_FOR_SELF = 4
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5495,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5496,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1RealDim4Kind64
    subroutine write_arrayRealDim4Kind128(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Real(REAL128), dimension(:, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim4Kind128'
      integer, parameter:: DIM_FOR_SELF = 4

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayRealDim4Kind128

    subroutine read_arrayRealDim4Kind128(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL128), dimension(:, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5571,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayRealDim4Kind128

    subroutine read_array_v_1RealDim4Kind128(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL128), dimension(:, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim4Kind128'
      integer, parameter:: DIM_FOR_SELF = 4
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5591,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5592,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1RealDim4Kind128
    subroutine write_arrayRealDim5Kind32(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Real(REAL32), dimension(:, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim5Kind32'
      integer, parameter:: DIM_FOR_SELF = 5

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayRealDim5Kind32

    subroutine read_arrayRealDim5Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL32), dimension(:, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5667,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayRealDim5Kind32

    subroutine read_array_v_1RealDim5Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL32), dimension(:, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim5Kind32'
      integer, parameter:: DIM_FOR_SELF = 5
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5687,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5688,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1RealDim5Kind32
    subroutine write_arrayRealDim5Kind64(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Real(REAL64), dimension(:, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim5Kind64'
      integer, parameter:: DIM_FOR_SELF = 5

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayRealDim5Kind64

    subroutine read_arrayRealDim5Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL64), dimension(:, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5763,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayRealDim5Kind64

    subroutine read_array_v_1RealDim5Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL64), dimension(:, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim5Kind64'
      integer, parameter:: DIM_FOR_SELF = 5
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5783,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5784,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1RealDim5Kind64
    subroutine write_arrayRealDim5Kind128(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Real(REAL128), dimension(:, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim5Kind128'
      integer, parameter:: DIM_FOR_SELF = 5

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayRealDim5Kind128

    subroutine read_arrayRealDim5Kind128(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL128), dimension(:, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5859,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayRealDim5Kind128

    subroutine read_array_v_1RealDim5Kind128(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL128), dimension(:, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim5Kind128'
      integer, parameter:: DIM_FOR_SELF = 5
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5879,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5880,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1RealDim5Kind128
    subroutine write_arrayRealDim6Kind32(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Real(REAL32), dimension(:, :, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim6Kind32'
      integer, parameter:: DIM_FOR_SELF = 6

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayRealDim6Kind32

    subroutine read_arrayRealDim6Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL32), dimension(:, :, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5955,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayRealDim6Kind32

    subroutine read_array_v_1RealDim6Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL32), dimension(:, :, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim6Kind32'
      integer, parameter:: DIM_FOR_SELF = 6
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5975,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 5976,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5), 1:sizes(6)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1RealDim6Kind32
    subroutine write_arrayRealDim6Kind64(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Real(REAL64), dimension(:, :, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim6Kind64'
      integer, parameter:: DIM_FOR_SELF = 6

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayRealDim6Kind64

    subroutine read_arrayRealDim6Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL64), dimension(:, :, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6051,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayRealDim6Kind64

    subroutine read_array_v_1RealDim6Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL64), dimension(:, :, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim6Kind64'
      integer, parameter:: DIM_FOR_SELF = 6
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6071,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6072,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5), 1:sizes(6)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1RealDim6Kind64
    subroutine write_arrayRealDim6Kind128(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Real(REAL128), dimension(:, :, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim6Kind128'
      integer, parameter:: DIM_FOR_SELF = 6

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayRealDim6Kind128

    subroutine read_arrayRealDim6Kind128(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL128), dimension(:, :, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6147,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayRealDim6Kind128

    subroutine read_array_v_1RealDim6Kind128(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL128), dimension(:, :, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim6Kind128'
      integer, parameter:: DIM_FOR_SELF = 6
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6167,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6168,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5), 1:sizes(6)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1RealDim6Kind128
    subroutine write_arrayRealDim7Kind32(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Real(REAL32), dimension(:, :, :, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim7Kind32'
      integer, parameter:: DIM_FOR_SELF = 7

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayRealDim7Kind32

    subroutine read_arrayRealDim7Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL32), dimension(:, :, :, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6243,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayRealDim7Kind32

    subroutine read_array_v_1RealDim7Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL32), dimension(:, :, :, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim7Kind32'
      integer, parameter:: DIM_FOR_SELF = 7
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6263,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6264,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5), 1:sizes(6), 1:sizes(7)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1RealDim7Kind32
    subroutine write_arrayRealDim7Kind64(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Real(REAL64), dimension(:, :, :, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim7Kind64'
      integer, parameter:: DIM_FOR_SELF = 7

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayRealDim7Kind64

    subroutine read_arrayRealDim7Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL64), dimension(:, :, :, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6339,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayRealDim7Kind64

    subroutine read_array_v_1RealDim7Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL64), dimension(:, :, :, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim7Kind64'
      integer, parameter:: DIM_FOR_SELF = 7
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6359,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6360,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5), 1:sizes(6), 1:sizes(7)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1RealDim7Kind64
    subroutine write_arrayRealDim7Kind128(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Real(REAL128), dimension(:, :, :, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim7Kind128'
      integer, parameter:: DIM_FOR_SELF = 7

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayRealDim7Kind128

    subroutine read_arrayRealDim7Kind128(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL128), dimension(:, :, :, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6435,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayRealDim7Kind128

    subroutine read_array_v_1RealDim7Kind128(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Real(REAL128), dimension(:, :, :, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'RealDim7Kind128'
      integer, parameter:: DIM_FOR_SELF = 7
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6455,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6456,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5), 1:sizes(6), 1:sizes(7)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1RealDim7Kind128
    subroutine write_arrayComplexDim1Kind32(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Complex(REAL32), dimension(:), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim1Kind32'
      integer, parameter:: DIM_FOR_SELF = 1

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayComplexDim1Kind32

    subroutine read_arrayComplexDim1Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL32), dimension(:), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6531,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayComplexDim1Kind32

    subroutine read_array_v_1ComplexDim1Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL32), dimension(:), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim1Kind32'
      integer, parameter:: DIM_FOR_SELF = 1
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6551,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6552,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1ComplexDim1Kind32
    subroutine write_arrayComplexDim1Kind64(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Complex(REAL64), dimension(:), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim1Kind64'
      integer, parameter:: DIM_FOR_SELF = 1

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayComplexDim1Kind64

    subroutine read_arrayComplexDim1Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL64), dimension(:), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6627,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayComplexDim1Kind64

    subroutine read_array_v_1ComplexDim1Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL64), dimension(:), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim1Kind64'
      integer, parameter:: DIM_FOR_SELF = 1
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6647,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6648,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1ComplexDim1Kind64
    subroutine write_arrayComplexDim1Kind128(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Complex(REAL128), dimension(:), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim1Kind128'
      integer, parameter:: DIM_FOR_SELF = 1

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayComplexDim1Kind128

    subroutine read_arrayComplexDim1Kind128(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL128), dimension(:), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6723,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayComplexDim1Kind128

    subroutine read_array_v_1ComplexDim1Kind128(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL128), dimension(:), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim1Kind128'
      integer, parameter:: DIM_FOR_SELF = 1
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6743,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6744,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1ComplexDim1Kind128
    subroutine write_arrayComplexDim2Kind32(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Complex(REAL32), dimension(:, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim2Kind32'
      integer, parameter:: DIM_FOR_SELF = 2

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayComplexDim2Kind32

    subroutine read_arrayComplexDim2Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL32), dimension(:, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6819,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayComplexDim2Kind32

    subroutine read_array_v_1ComplexDim2Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL32), dimension(:, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim2Kind32'
      integer, parameter:: DIM_FOR_SELF = 2
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6839,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6840,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1ComplexDim2Kind32
    subroutine write_arrayComplexDim2Kind64(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Complex(REAL64), dimension(:, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim2Kind64'
      integer, parameter:: DIM_FOR_SELF = 2

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayComplexDim2Kind64

    subroutine read_arrayComplexDim2Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL64), dimension(:, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6915,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayComplexDim2Kind64

    subroutine read_array_v_1ComplexDim2Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL64), dimension(:, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim2Kind64'
      integer, parameter:: DIM_FOR_SELF = 2
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6935,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 6936,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1ComplexDim2Kind64
    subroutine write_arrayComplexDim2Kind128(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Complex(REAL128), dimension(:, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim2Kind128'
      integer, parameter:: DIM_FOR_SELF = 2

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayComplexDim2Kind128

    subroutine read_arrayComplexDim2Kind128(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL128), dimension(:, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7011,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayComplexDim2Kind128

    subroutine read_array_v_1ComplexDim2Kind128(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL128), dimension(:, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim2Kind128'
      integer, parameter:: DIM_FOR_SELF = 2
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7031,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7032,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1ComplexDim2Kind128
    subroutine write_arrayComplexDim3Kind32(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Complex(REAL32), dimension(:, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim3Kind32'
      integer, parameter:: DIM_FOR_SELF = 3

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayComplexDim3Kind32

    subroutine read_arrayComplexDim3Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL32), dimension(:, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7107,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayComplexDim3Kind32

    subroutine read_array_v_1ComplexDim3Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL32), dimension(:, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim3Kind32'
      integer, parameter:: DIM_FOR_SELF = 3
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7127,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7128,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1ComplexDim3Kind32
    subroutine write_arrayComplexDim3Kind64(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Complex(REAL64), dimension(:, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim3Kind64'
      integer, parameter:: DIM_FOR_SELF = 3

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayComplexDim3Kind64

    subroutine read_arrayComplexDim3Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL64), dimension(:, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7203,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayComplexDim3Kind64

    subroutine read_array_v_1ComplexDim3Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL64), dimension(:, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim3Kind64'
      integer, parameter:: DIM_FOR_SELF = 3
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7223,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7224,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1ComplexDim3Kind64
    subroutine write_arrayComplexDim3Kind128(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Complex(REAL128), dimension(:, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim3Kind128'
      integer, parameter:: DIM_FOR_SELF = 3

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayComplexDim3Kind128

    subroutine read_arrayComplexDim3Kind128(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL128), dimension(:, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7299,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayComplexDim3Kind128

    subroutine read_array_v_1ComplexDim3Kind128(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL128), dimension(:, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim3Kind128'
      integer, parameter:: DIM_FOR_SELF = 3
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7319,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7320,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1ComplexDim3Kind128
    subroutine write_arrayComplexDim4Kind32(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Complex(REAL32), dimension(:, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim4Kind32'
      integer, parameter:: DIM_FOR_SELF = 4

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayComplexDim4Kind32

    subroutine read_arrayComplexDim4Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL32), dimension(:, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7395,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayComplexDim4Kind32

    subroutine read_array_v_1ComplexDim4Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL32), dimension(:, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim4Kind32'
      integer, parameter:: DIM_FOR_SELF = 4
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7415,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7416,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1ComplexDim4Kind32
    subroutine write_arrayComplexDim4Kind64(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Complex(REAL64), dimension(:, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim4Kind64'
      integer, parameter:: DIM_FOR_SELF = 4

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayComplexDim4Kind64

    subroutine read_arrayComplexDim4Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL64), dimension(:, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7491,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayComplexDim4Kind64

    subroutine read_array_v_1ComplexDim4Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL64), dimension(:, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim4Kind64'
      integer, parameter:: DIM_FOR_SELF = 4
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7511,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7512,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1ComplexDim4Kind64
    subroutine write_arrayComplexDim4Kind128(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Complex(REAL128), dimension(:, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim4Kind128'
      integer, parameter:: DIM_FOR_SELF = 4

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayComplexDim4Kind128

    subroutine read_arrayComplexDim4Kind128(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL128), dimension(:, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7587,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayComplexDim4Kind128

    subroutine read_array_v_1ComplexDim4Kind128(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL128), dimension(:, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim4Kind128'
      integer, parameter:: DIM_FOR_SELF = 4
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7607,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7608,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1ComplexDim4Kind128
    subroutine write_arrayComplexDim5Kind32(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Complex(REAL32), dimension(:, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim5Kind32'
      integer, parameter:: DIM_FOR_SELF = 5

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayComplexDim5Kind32

    subroutine read_arrayComplexDim5Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL32), dimension(:, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7683,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayComplexDim5Kind32

    subroutine read_array_v_1ComplexDim5Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL32), dimension(:, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim5Kind32'
      integer, parameter:: DIM_FOR_SELF = 5
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7703,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7704,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1ComplexDim5Kind32
    subroutine write_arrayComplexDim5Kind64(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Complex(REAL64), dimension(:, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim5Kind64'
      integer, parameter:: DIM_FOR_SELF = 5

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayComplexDim5Kind64

    subroutine read_arrayComplexDim5Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL64), dimension(:, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7779,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayComplexDim5Kind64

    subroutine read_array_v_1ComplexDim5Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL64), dimension(:, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim5Kind64'
      integer, parameter:: DIM_FOR_SELF = 5
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7799,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7800,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1ComplexDim5Kind64
    subroutine write_arrayComplexDim5Kind128(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Complex(REAL128), dimension(:, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim5Kind128'
      integer, parameter:: DIM_FOR_SELF = 5

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayComplexDim5Kind128

    subroutine read_arrayComplexDim5Kind128(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL128), dimension(:, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7875,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayComplexDim5Kind128

    subroutine read_array_v_1ComplexDim5Kind128(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL128), dimension(:, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim5Kind128'
      integer, parameter:: DIM_FOR_SELF = 5
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7895,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7896,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1ComplexDim5Kind128
    subroutine write_arrayComplexDim6Kind32(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Complex(REAL32), dimension(:, :, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim6Kind32'
      integer, parameter:: DIM_FOR_SELF = 6

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayComplexDim6Kind32

    subroutine read_arrayComplexDim6Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL32), dimension(:, :, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7971,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayComplexDim6Kind32

    subroutine read_array_v_1ComplexDim6Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL32), dimension(:, :, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim6Kind32'
      integer, parameter:: DIM_FOR_SELF = 6
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7991,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 7992,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5), 1:sizes(6)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1ComplexDim6Kind32
    subroutine write_arrayComplexDim6Kind64(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Complex(REAL64), dimension(:, :, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim6Kind64'
      integer, parameter:: DIM_FOR_SELF = 6

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayComplexDim6Kind64

    subroutine read_arrayComplexDim6Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL64), dimension(:, :, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8067,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayComplexDim6Kind64

    subroutine read_array_v_1ComplexDim6Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL64), dimension(:, :, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim6Kind64'
      integer, parameter:: DIM_FOR_SELF = 6
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8087,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8088,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5), 1:sizes(6)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1ComplexDim6Kind64
    subroutine write_arrayComplexDim6Kind128(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Complex(REAL128), dimension(:, :, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim6Kind128'
      integer, parameter:: DIM_FOR_SELF = 6

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayComplexDim6Kind128

    subroutine read_arrayComplexDim6Kind128(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL128), dimension(:, :, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8163,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayComplexDim6Kind128

    subroutine read_array_v_1ComplexDim6Kind128(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL128), dimension(:, :, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim6Kind128'
      integer, parameter:: DIM_FOR_SELF = 6
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8183,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8184,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5), 1:sizes(6)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1ComplexDim6Kind128
    subroutine write_arrayComplexDim7Kind32(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Complex(REAL32), dimension(:, :, :, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim7Kind32'
      integer, parameter:: DIM_FOR_SELF = 7

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayComplexDim7Kind32

    subroutine read_arrayComplexDim7Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL32), dimension(:, :, :, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8259,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayComplexDim7Kind32

    subroutine read_array_v_1ComplexDim7Kind32(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL32), dimension(:, :, :, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim7Kind32'
      integer, parameter:: DIM_FOR_SELF = 7
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8279,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8280,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5), 1:sizes(6), 1:sizes(7)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1ComplexDim7Kind32
    subroutine write_arrayComplexDim7Kind64(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Complex(REAL64), dimension(:, :, :, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim7Kind64'
      integer, parameter:: DIM_FOR_SELF = 7

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayComplexDim7Kind64

    subroutine read_arrayComplexDim7Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL64), dimension(:, :, :, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8355,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayComplexDim7Kind64

    subroutine read_array_v_1ComplexDim7Kind64(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL64), dimension(:, :, :, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim7Kind64'
      integer, parameter:: DIM_FOR_SELF = 7
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8375,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8376,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5), 1:sizes(6), 1:sizes(7)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1ComplexDim7Kind64
    subroutine write_arrayComplexDim7Kind128(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Complex(REAL128), dimension(:, :, :, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim7Kind128'
      integer, parameter:: DIM_FOR_SELF = 7

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayComplexDim7Kind128

    subroutine read_arrayComplexDim7Kind128(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL128), dimension(:, :, :, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8451,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayComplexDim7Kind128

    subroutine read_array_v_1ComplexDim7Kind128(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Complex(REAL128), dimension(:, :, :, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'ComplexDim7Kind128'
      integer, parameter:: DIM_FOR_SELF = 7
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8471,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8472,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5), 1:sizes(6), 1:sizes(7)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1ComplexDim7Kind128
    subroutine write_arrayCharacterDim1LenAst(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Character(len = *), dimension(:), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'CharacterDim1LenAst'
      integer, parameter:: DIM_FOR_SELF = 1

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayCharacterDim1LenAst

    subroutine read_arrayCharacterDim1LenAst(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Character(len = *), dimension(:), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8547,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayCharacterDim1LenAst

    subroutine read_array_v_1CharacterDim1LenAst(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Character(len = *), dimension(:), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'CharacterDim1LenAst'
      integer, parameter:: DIM_FOR_SELF = 1
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8567,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8568,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1CharacterDim1LenAst
    subroutine write_arrayCharacterDim2LenAst(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Character(len = *), dimension(:, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'CharacterDim2LenAst'
      integer, parameter:: DIM_FOR_SELF = 2

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayCharacterDim2LenAst

    subroutine read_arrayCharacterDim2LenAst(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Character(len = *), dimension(:, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8643,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayCharacterDim2LenAst

    subroutine read_array_v_1CharacterDim2LenAst(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Character(len = *), dimension(:, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'CharacterDim2LenAst'
      integer, parameter:: DIM_FOR_SELF = 2
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8663,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8664,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1CharacterDim2LenAst
    subroutine write_arrayCharacterDim3LenAst(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Character(len = *), dimension(:, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'CharacterDim3LenAst'
      integer, parameter:: DIM_FOR_SELF = 3

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayCharacterDim3LenAst

    subroutine read_arrayCharacterDim3LenAst(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Character(len = *), dimension(:, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8739,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayCharacterDim3LenAst

    subroutine read_array_v_1CharacterDim3LenAst(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Character(len = *), dimension(:, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'CharacterDim3LenAst'
      integer, parameter:: DIM_FOR_SELF = 3
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8759,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8760,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1CharacterDim3LenAst
    subroutine write_arrayCharacterDim4LenAst(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Character(len = *), dimension(:, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'CharacterDim4LenAst'
      integer, parameter:: DIM_FOR_SELF = 4

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayCharacterDim4LenAst

    subroutine read_arrayCharacterDim4LenAst(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Character(len = *), dimension(:, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8835,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayCharacterDim4LenAst

    subroutine read_array_v_1CharacterDim4LenAst(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Character(len = *), dimension(:, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'CharacterDim4LenAst'
      integer, parameter:: DIM_FOR_SELF = 4
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8855,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8856,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1CharacterDim4LenAst
    subroutine write_arrayCharacterDim5LenAst(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Character(len = *), dimension(:, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'CharacterDim5LenAst'
      integer, parameter:: DIM_FOR_SELF = 5

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayCharacterDim5LenAst

    subroutine read_arrayCharacterDim5LenAst(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Character(len = *), dimension(:, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8931,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayCharacterDim5LenAst

    subroutine read_array_v_1CharacterDim5LenAst(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Character(len = *), dimension(:, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'CharacterDim5LenAst'
      integer, parameter:: DIM_FOR_SELF = 5
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8951,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 8952,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1CharacterDim5LenAst
    subroutine write_arrayCharacterDim6LenAst(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Character(len = *), dimension(:, :, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'CharacterDim6LenAst'
      integer, parameter:: DIM_FOR_SELF = 6

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayCharacterDim6LenAst

    subroutine read_arrayCharacterDim6LenAst(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Character(len = *), dimension(:, :, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 9027,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayCharacterDim6LenAst

    subroutine read_array_v_1CharacterDim6LenAst(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Character(len = *), dimension(:, :, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'CharacterDim6LenAst'
      integer, parameter:: DIM_FOR_SELF = 6
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 9047,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 9048,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5), 1:sizes(6)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1CharacterDim6LenAst
    subroutine write_arrayCharacterDim7LenAst(arrayDir, array, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10)
      character(len = *), intent(in):: arrayDir
      Character(len = *), dimension(:, :, :, :, :, :, :), intent(in):: array
        character(len = *), intent(in), optional:: desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, desc9, desc10

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'CharacterDim7LenAst'
      integer, parameter:: DIM_FOR_SELF = 7

      character(len = len(DATA_TYPE_FOR_SELF)) dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: wU1
      integer:: i

      namelist /array_meta/ dataType, dim, sizes

      call mkdir_p(s(arrayDir))

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'replace', action = 'write')
      write(wU1, *) VERSION
      close(wU1)

      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'replace', action = 'write', form = 'unformatted')
      write(wU1) array
      close(wU1)

      dataType = DATA_TYPE_FOR_SELF
      dim = DIM_FOR_SELF
      forall(i = 1:dim) sizes(i) = size(array, i)
      call new_unit(wU1)
      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'replace', action = 'write', delim = 'quote')
      write(wU1, nml = array_meta)
      close(wU1)

      open(unit = wU1, file = s(arrayDir) // '/' // ARRAY_DESCRIPTION_FILE, status = 'replace', action = 'write')
        if(present(desc1)) write(wU1, *) desc1
        if(present(desc2)) write(wU1, *) desc2
        if(present(desc3)) write(wU1, *) desc3
        if(present(desc4)) write(wU1, *) desc4
        if(present(desc5)) write(wU1, *) desc5
        if(present(desc6)) write(wU1, *) desc6
        if(present(desc7)) write(wU1, *) desc7
        if(present(desc8)) write(wU1, *) desc8
        if(present(desc9)) write(wU1, *) desc9
        if(present(desc10)) write(wU1, *) desc10
      close(wU1)
    end subroutine write_arrayCharacterDim7LenAst

    subroutine read_arrayCharacterDim7LenAst(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Character(len = *), dimension(:, :, :, :, :, :, :), intent(out), allocatable:: array

      integer:: rU1, libIoVersion

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_VERSION_FILE, status = 'old', action = 'read')
      read(rU1, *) libIoVersion
      close(rU1)

      select case(libIoVersion)
      case(1)
        call read_array_v_1(arrayDir, array)
      case default
        write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 9123,'Unsupported version: ', libIoVersion; stop 1
      end select
    end subroutine read_arrayCharacterDim7LenAst

    subroutine read_array_v_1CharacterDim7LenAst(arrayDir, array)
      character(len = *), intent(in):: arrayDir
      Character(len = *), dimension(:, :, :, :, :, :, :), intent(out), allocatable:: array

      character(len = *), parameter:: DATA_TYPE_FOR_SELF = 'CharacterDim7LenAst'
      integer, parameter:: DIM_FOR_SELF = 7
      character(len = 19):: dataType
      integer:: dim
      integer:: sizes(1:DIM_FOR_SELF)
      integer:: rU1
      namelist /array_meta/ dataType, dim, sizes

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_META_FILE, status = 'old', action = 'read', delim = 'quote')
      read(rU1, nml = array_meta)

      if(s(dataType) /= DATA_TYPE_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 9143,"s(dataType) /= DATA_TYPE_FOR_SELF", " ", 'Expected: ', DATA_TYPE_FOR_SELF, ' Got: ', s(dataType), ' for ', s(arrayDir); stop 1; end if
      if(dim /= DIM_FOR_SELF)then; write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 9144,"dim /= DIM_FOR_SELF", " ", 'Expected: ', DIM_FOR_SELF, ' ', ' Got: ', dim, ' for ', s(arrayDir); stop 1; end if

      close(rU1)

      allocate(array(1:sizes(1), 1:sizes(2), 1:sizes(3), 1:sizes(4), 1:sizes(5), 1:sizes(6), 1:sizes(7)))

      call new_unit(rU1)
      open(unit = rU1, file = s(arrayDir) // '/' // ARRAY_DATA_FILE, status = 'old', action = 'read', form = 'unformatted')
      read(rU1) array
    end subroutine read_array_v_1CharacterDim7LenAst


    subroutine new_unitIntegerDim0Kind8(n)
      Integer(INT8), intent(out):: n
      integer(kind(n)):: i
      logical:: isOpened

      do i = NEW_UNIT_MIN, min(huge(n), NEW_UNIT_MAX)
        inquire(unit = i, opened = isOpened)
        if(.not.(isOpened))then
          n = i
          return
        end if
      end do

      write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 9169,"No available unit number exist between: ", NEW_UNIT_MIN, NEW_UNIT_MAX; stop 1
    end subroutine new_unitIntegerDim0Kind8
    subroutine new_unitIntegerDim0Kind16(n)
      Integer(INT16), intent(out):: n
      integer(kind(n)):: i
      logical:: isOpened

      do i = NEW_UNIT_MIN, min(huge(n), NEW_UNIT_MAX)
        inquire(unit = i, opened = isOpened)
        if(.not.(isOpened))then
          n = i
          return
        end if
      end do

      write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 9184,"No available unit number exist between: ", NEW_UNIT_MIN, NEW_UNIT_MAX; stop 1
    end subroutine new_unitIntegerDim0Kind16
    subroutine new_unitIntegerDim0Kind32(n)
      Integer(INT32), intent(out):: n
      integer(kind(n)):: i
      logical:: isOpened

      do i = NEW_UNIT_MIN, min(huge(n), NEW_UNIT_MAX)
        inquire(unit = i, opened = isOpened)
        if(.not.(isOpened))then
          n = i
          return
        end if
      end do

      write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 9199,"No available unit number exist between: ", NEW_UNIT_MIN, NEW_UNIT_MAX; stop 1
    end subroutine new_unitIntegerDim0Kind32
    subroutine new_unitIntegerDim0Kind64(n)
      Integer(INT64), intent(out):: n
      integer(kind(n)):: i
      logical:: isOpened

      do i = NEW_UNIT_MIN, min(huge(n), NEW_UNIT_MAX)
        inquire(unit = i, opened = isOpened)
        if(.not.(isOpened))then
          n = i
          return
        end if
      end do

      write(ERROR_UNIT, *) "RAISE ", "lib_io.f90", " ", 9214,"No available unit number exist between: ", NEW_UNIT_MIN, NEW_UNIT_MAX; stop 1
    end subroutine new_unitIntegerDim0Kind64
end module lib_io
