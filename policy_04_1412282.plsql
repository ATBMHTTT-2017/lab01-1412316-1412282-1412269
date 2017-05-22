--Tạo View thông tin dự án
CREATE VIEW TTDUAN AS
SELECT DA.maDA,DA.tenDA,DA.kinhPhi,PB.tenPhong,CN.tenCN,NV.hoTen,sum(CT.soTien) as N'Tổng chi'
FROM DUAN DA, PHONGBAN PB, CHINHANH CN, NHANVIEN NV, CHITIEU CT
WHERE DA.phongChuTri = PB.maPhong and PB.chiNhanh = CN.maCN and DA.truongDA = NV.maNV and CT.duAn = DA.maDA
GROUP BY CT.duAn,DA.maDA,DA.tenDA,DA.kinhPhi,PB.tenPhong,CN.tenCN,NV.hoTen
--DAC giám đốc
grant select on TTDUAN to GiamDoc
