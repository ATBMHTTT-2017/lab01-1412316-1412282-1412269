--Tạo store procedure cập nhật  
Create Procedure UPDATEPB(TruongCN char(9 char),MaPB char(9 char), TenPB nvarchar2(30), TruongPB char(9 char), NgayNhanChuc date, SoNV int, ChiNhanh number(10,0))
Begin

Update PHONGBAN PB
Set PB.tenPhong = TenPB, PB.truongPhong = TruongPB, PB.ngayNhanChuc = NgayNhanChuc, PB.soNhanVien = SoNV, PB.chiNhanh = ChiNhanh
Where PB.TruongPB = TruongPB and
TruongCN In (Select CN.truongChiNhanh
			 From CHINHANH CN, PHONGBAN PB
			 Where PB.chiNhanh = CN.maCN)
					  
End;
--Gán quyền thực thi cho TruongPhong và TruongCN
grant execute on UPDATEPB to TruongPhong,TruongCN 
