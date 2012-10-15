program displacement_after
!-----------------------------------------------------------------------------------------
!計算が終了し、得られたnew_in_gm.datから
!最終的な粒子の位置を読み込んで
!最上位に位置する粒子の上面を結んだ線を描く
!これが地表面のラインとなる
!
!dtime, gx, gy,  mode, mode2, mode3, nmater, rho(i),   :もとのプログラムでは利用
! akn(i), aks(i), cn(i), cs(i), phimu(i)               :　今回は利用しないがとりあえず読み込む
!bdp(1), bdp(2), bdp(3), bdp(4), thick   :計算する領域x1,x2,y1,y2,境界の厚み
!nptotc, nptts1, nptts2   :円形要素粒子数、セグメント要素粒子数
!nptotl   :全粒子数
!i  :材料の番号
!k  :粒子の番号
!icr  :要素の番号
!ik,iicr  :読み込み用のダミーの番号
!imater    :粒子を作る材料番号
!nset(k)　　:粒子を作る要素数
!vgx(k), vgy(k), vgw(k)   :粒子に与える初速
!
!
!
!
!
!
!
!
!------------------------------------------------------------------------------------------
 implicit none
 real :: dtime, gx, gy
 integer :: mode, mode2, mode3, nmater, rho(i), akn(i), aks(i), cn(i), cs(i), phimu(i)
 real :: bdp(1), bdp(2), bdp(3), bdp(4), thick, vgx(k), vgy(k), vgw(k),
 &       rc(icr), xc(icr), yc(icr), wc(icr), edg1x, edg1y, edg2x, edg2y
 integer :: i, k, icr, nptotc, nptts1, nptts2, nptotl, idum, imater, nset(k), ik, iicr
  !ファイルnew_in_gm.datを開く
  open(unit=20, file='new_in_gm.dat', status='old')
  read(20,*) mode, mode2, mode3
  read(20,*) dtime, gx, gy
  read(20,*) nmater
    do i = 1, nmater
      read(20,*) rho(i), akn(i), aks(i), cn(i), cs(i), phimu(i)
    end do
  !計算する領域を読み込む
  read(20,*) bdp(1), bdp(2), bdp(3), bdp(4), thick
  !ここから粒子の読み込み
  read(20,*) nptotc, nptts1, nptts2
  nptotl = nptotc + nptts1 + nptts2
    !粒子の数だけ読み込む
    do k = 1, nptotl
	  read(20,*) ik, imater, nset(k)
	  read(20,*) vgx(k), vgy(k), vgw(k)
	  　!粒子を構成する要素の数だけ読み込む
	    do icr = 1, nset(k)
		  if(k.le.nptotc) then
            read(20,*) iicr, rc(icr)
            read(20,*) xc(icr), yc(icr), wc(icr)
		  else
		    read(2,*) iicr, edg1x, edg1y
            read(2,*) edg2x, edg2y
		end do
	end do
  close(20)