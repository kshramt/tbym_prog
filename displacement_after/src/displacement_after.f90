!-----------------------------------------------------------------------------------------
!計算が終了し、得られたnew_in_gm.datから
!最終的な粒子の位置を読み込んで
!最上位に位置する粒子の上面を結んだ線を描く
!これが地表面のラインとなる
!
!dtime, gx, gy,  mode, mode2, mode3, nMater, rho(i),   :もとのプログラムでは利用
! akn(i), aks(i), cn(i), cs(i), phimu(i)               :　今回は利用しないがとりあえず読み込む
!bdp(1), bdp(2), bdp(3), bdp(4), thick   :計算する領域x1,x2,y1,y2,境界の厚み
!nptotc, nptts1, nptts2   :円形要素粒子数、セグメント要素粒子数
! 円形粒子、セグメント（接触判定が）、セグメント
!nParticlesTotal   :全粒子数
!i  :材料の番号
!k  :粒子の番号
!icr  :要素の番号
!ik,iicr  :読み込み用のダミーの番号
!imater    :粒子を作る材料番号
!nset(k)　　:粒子を作る要素数
!vgx(k), vgy(k), vgw(k)   :粒子に与える初速
!------------------------------------------------------------------------------------------
#include "utils.h"
program displacement_after
  USE_UTILS_H
  use lib_io, only: new_unit
  use lib_displacement_after, only: DisplacementAfterConfig, BinnedHeight
  use lib_displacement_after, only: read, get, write
  use lib_displacement_after, only: OUTPUT_DIR

  implicit none

  Real :: dtime, gx, gy
  Integer :: mode1, mode2, mode3, nMater
  Real, allocatable :: rho(:), akn(:), aks(:), cn(:), cs(:), phimu(:)
  Real :: bdp(1:4), thick
  Real, allocatable :: vgx(:), vgy(:), vgw(:)
  Real, allocatable ::rc(:, :), xc(:, :), yc(:, :), wc(:, :), & ! k番目の粒子のicr番目の要素の値
    & edg1x(:, :), edg1y(:, :), edg2x(:, :), edg2y(:, :)
  Integer :: i, k, icr, nptotc, nptts1, nptts2, nParticlesTotal, imater, ik, iicr
  Integer, allocatable :: nset(:)
  Integer:: io
  type(BinnedHeight), allocatable:: binnedHeights(:)
  type(DisplacementAfterConfig):: config

  call read(config)

  !ファイルnew_in_gm.datを開く
  call new_unit(io)
  open(unit = io, file='new_in_gm.dat', status='old', action = 'read')

  read(io, *) mode1, mode2, mode3
  read(io, *) dtime, gx, gy
  read(io, *) nMater
  allocate(&
    & rho(1:nMater), &
    & akn(1:nMater), aks(1:nMater), &
    & cn(1:nMater), cs(1:nMater), &
    & phimu(1:nMater))

  do i = 1, nMater
    read(io, *) rho(i), akn(i), aks(i), cn(i), cs(i), phimu(i) ! k: バネ定数, c: 粘性, n: 垂直, s: 剪断, phimu: 内部摩擦角
  end do

  !計算する領域を読み込む
  read(io, *) bdp(1), bdp(2), bdp(3), bdp(4), thick
  !ここから粒子の読み込み
  read(io, *) nptotc, nptts1, nptts2
  nParticlesTotal = nptotc + nptts1 + nptts2
  allocate(vgx(nParticlesTotal), vgy(nParticlesTotal), vgw(nParticlesTotal))
  allocate(&
    & rc(1:nptotc, 1:config%nElementsParParticleMax), &
    & xc(1:nptotc, 1:config%nElementsParParticleMax), &
    & yc(1:nptotc, 1:config%nElementsParParticleMax), &
    & wc(1:nptotc, 1:config%nElementsParParticleMax), &
    & nset(1:nParticlesTotal), &
    & edg1x(1:nParticlesTotal, 1:config%nElementsParParticleMax), &
    & edg1y(1:nParticlesTotal, 1:config%nElementsParParticleMax), &
    & edg2x(1:nParticlesTotal, 1:config%nElementsParParticleMax), &
    & edg2y(1:nParticlesTotal, 1:config%nElementsParParticleMax))

  !粒子の数だけ読み込む
  do k = 1, nParticlesTotal
    read(io, *) ik, imater, nset(k)
    read(io, *) vgx(k), vgy(k), vgw(k)

    !粒子を構成する要素の数だけ読み込む
    do icr = 1, nset(k)
      if(k <= nptotc) then
        read(io, *) iicr, rc(k, icr)
        read(io, *) xc(k, icr), yc(k, icr), wc(k, icr)
      else
        read(io, *) iicr, edg1x(k, icr), edg1y(k, icr)
        read(io, *) edg2x(k, icr), edg2y(k, icr)
      end if
    end do
  end do

  close(io)

  ! この時点で、xc(:, :), yc(:, :), rc(:, :), nset(:)が必要です。
  ! 粒子の個数は、1:nptotcです。
  ! k番目の粒子を構成する要素の個数はnset(k)です。
  ! binで区切って、それぞれのbinの中心のx座標と粒子の最大高さを求めます。
  ! 必要なパラメータは、binの数です。
  call get(binnedHeights, config, bdp(1), bdp(2), rc, xc, yc, nset)

  call write(binnedHeights)
  call write(xc(1:nptotc, :), yc(1:nptotc, :), rc(1:nptotc, :), nset(1:nptotc))

  call new_unit(io)
  open(io, file = OUTPUT_DIR // '/' // 'box.dat', status = 'replace', action = 'write')
  write(io, *) bdp
  close(io)

  stop
end program displacement_after
