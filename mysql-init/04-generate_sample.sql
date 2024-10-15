
-- INSERT CITY FIRST FOR VISUALIZATION

INSERT INTO sales_city(name, createdDate)
VALUES
    ("Hà Nội", "2024-10-4"),
    ("Hồ Chí Minh", "2024-10-4"),
    ("Hải Phòng", "2024-10-4"),
    ("Cần Thơ", "2024-10-4"),
    ("Đà Nẵng", "2024-10-4"),
    ("Biên Hòa", "2024-10-4"),
    ("Hải Dương", "2024-10-4"),
    ("Huế", "2024-10-4"),
    ("Thuận An", "2024-10-4"),
    ("Thủ Đức", "2024-10-4");

INSERT INTO sales_source_online(link_name, createdDate)
VALUES
    ("Shopee", "2024-10-4"),
    ("Tiktok", "2024-10-4"),
    ("Tiki", "2024-10-4"),
    ("Lazada", "2024-10-4");

CALL insert_base_data();
CALL update_total_order();
