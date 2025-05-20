b1:
các thực thể (entity) chính là:
PHIEUXUAT
PHIEUNHAP
VATTU
DONDH
NHACC
b2:
Phân tích các mối quan hệ giữa các thực thể:
PHIEUXUAT - VATTU: Quan hệ n - n, sinh bảng trung gian CT_PHIEUXUAT
PHIEUNHAP - VATTU: Quan hệ n - n, sinh bảng trung gian CT_PHIEUNHAP
DONDH - VATTU: Quan hệ n - n, sinh bảng trung gian CT_DONDH
NHACC - VATTU: Quan hệ 1 - n, mỗi vật tư được cung cấp bởi nhiều nhà cung cấp => sinh bảng CUNG_CAP
b3:
không có thuộc tính đa trị nào trong sơ đồ.
b4:
chuyển đổi sang mô hình dữ liệu quan hệ:
PHIEUXUAT (
    SoPX PRIMARY KEY,
    NgayXuat DATE
)
PHIEUNHAP (
    SoPN PRIMARY KEY,
    NgayNhap DATE
)
VATTU (
    MaVTU PRIMARY KEY,
    TenVTU VARCHAR
)
DONDH (
    SoDH PRIMARY KEY,
    NgayDH DATE
)
NHACC (
    MaNCC PRIMARY KEY,
    TenNCC VARCHAR,
    DiaChi VARCHAR,
    SDT VARCHAR
)
các bảng trung gian sinh ra từ mối quan hệ n-n:
CT_PHIEUXUAT (
    SoPX FOREIGN KEY REFERENCES PHIEUXUAT(SoPX),
    MaVTU FOREIGN KEY REFERENCES VATTU(MaVTU),
    DGXuat FLOAT,
    SLXuat INT,
    PRIMARY KEY (SoPX, MaVTU)
)
CT_PHIEUNHAP (
    SoPN FOREIGN KEY REFERENCES PHIEUNHAP(SoPN),
    MaVTU FOREIGN KEY REFERENCES VATTU(MaVTU),
    DGNhap FLOAT,
    SLNhap INT,
    PRIMARY KEY (SoPN, MaVTU)
)
CT_DONDH (
    SoDH FOREIGN KEY REFERENCES DONDH(SoDH),
    MaVTU FOREIGN KEY REFERENCES VATTU(MaVTU),
    PRIMARY KEY (SoDH, MaVTU)
)
CUNG_CAP (
    MaNCC FOREIGN KEY REFERENCES NHACC(MaNCC),
    MaVTU FOREIGN KEY REFERENCES VATTU(MaVTU),
    PRIMARY KEY (MaNCC, MaVTU)
)
Tóm tắt các bảng sinh ra:
PHIEUXUAT
PHIEUNHAP
VATTU
DONDH
NHACC
CT_PHIEUXUAT
CT_PHIEUNHAP
CT_DONDH
CUNG_CAP
