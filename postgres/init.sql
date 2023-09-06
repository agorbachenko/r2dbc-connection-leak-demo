CREATE DATABASE r2dbc_connection_leak_demo;

create table demo
(
    id              bigserial
        primary key,
    catalog_id      bigint      not null,
    code            varchar(50) not null default gen_random_uuid()
        constraint uix_code
            unique,
    ref_catalog_ids json,
    active          boolean              default true,
    category        varchar(20)
);

INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (1, 553660149, '[
  553648229,
  553648230
]', true, 'cat1');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (2, 553662531, '[]', true, 'cat1');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (3, 553648230, '[]', true, 'cat1');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (4, 553648139, '[
  553648229,
  553648230
]', true, 'cat1');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (5, 553662893, '[]', true, 'cat1');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (6, 553661999, '[]', true, 'cat1');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (7, 553648229, '[]', true, 'cat1');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (8, 436220514, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (9, 436220521, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (10, 436207629, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (11, 436207751, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (12, 436207755, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (14, 436220730, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (13, 436219809, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (15, 436207720, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (16, 436208128, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (17, 436220510, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (18, 838873345, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (19, 436208151, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (20, 436207718, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (21, 436208124, '[
  436207717,
  436207734
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (22, 436208121, '[
  436207728,
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (23, 436222095, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (24, 436221924, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (25, 436208155, '[
  436207763,
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (26, 436207889, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (27, 436208126, '[
  436207717,
  436207738
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (28, 436207759, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (29, 436207673, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (30, 436222025, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (31, 436208171, '[
  436207889,
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (32, 436222049, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (33, 436208149, '[
  436207717,
  436207759
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (34, 436208162, '[
  436207765,
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (35, 436207766, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (36, 436219957, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (37, 436220462, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (38, 436220778, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (39, 436220735, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (40, 436207768, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (41, 436207628, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (42, 436208166, '[
  436207717,
  436207766
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (43, 436207752, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (44, 436207748, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (45, 436216706, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (46, 436207756, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (47, 436217622, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (48, 436220639, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (49, 436207742, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (50, 436208142, '[
  436207717,
  436207752
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (51, 436219641, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (52, 436207749, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (53, 50343794, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (54, 436207754, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (55, 436207753, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (56, 436207717, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (57, 436207744, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (58, 436207740, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (59, 436207730, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (60, 436219640, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (61, 436207622, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (62, 436207747, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (63, 436207724, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (64, 436208144, '[
  436207717,
  436207754
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (65, 436219644, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (66, 436219638, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (67, 436207734, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (68, 436207745, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (69, 436207732, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (70, 436208132, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (71, 436207738, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (72, 436208129, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (73, 436219645, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (74, 436208130, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (75, 436208131, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (76, 436208175, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (77, 436208133, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (78, 436207726, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (79, 436208135, '[
  436207745,
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (80, 436220376, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (81, 436222097, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (82, 436217617, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (83, 436207760, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (84, 436207762, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (85, 436208140, '[
  436207717,
  436207750
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (86, 436207761, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (87, 436216630, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (88, 436216631, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (89, 436207757, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (90, 436208148, '[
  436207717,
  436207758
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (91, 436208176, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (92, 436207758, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (93, 436208147, '[
  436207717,
  436207757
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (94, 436208174, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (95, 436208173, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (96, 436207767, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (97, 436208164, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (98, 436220680, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (99, 436208118, '[
  50343874,
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (100, 50343820, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (101, 50343789, '[
  436207717,
  50343790
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (102, 50343810, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (103, 436219779, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (104, 436208172, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (105, 50343815, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (106, 436207765, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (107, 50343808, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (108, 436207764, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (109, 436220675, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (110, 50343871, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (121, 436219642, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (131, 50344190, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (140, 50343968, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (150, 436220490, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (160, 436208125, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (169, 436220491, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (179, 436220277, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (189, 436208150, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (196, 436222088, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (210, 436217618, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (221, 436222234, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (229, 436220408, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (241, 444610723, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (249, 16789388, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (261, 444596235, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (270, 444609333, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (278, 444596228, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (288, 444609144, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (298, 452999250, '[]', true, 'cat4');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (307, 444611083, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (111, 436217619, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (120, 436219751, '[
  436207718
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (128, 436220374, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (139, 436220681, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (149, 50343818, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (159, 436219780, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (170, 436219636, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (180, 436220063, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (190, 436220291, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (199, 436208120, '[
  436207717,
  436207726
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (208, 436220051, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (220, 436207638, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (230, 436219637, '[
  436207717,
  436207718
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (237, 444608470, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (250, 16786228, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (256, 444608565, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (267, 444608536, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (282, 444610659, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (291, 444610722, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (300, 452984833, '[]', true, 'cat4');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (112, 436207722, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (123, 436219781, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (133, 50344169, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (145, 436220362, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (153, 436221951, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (162, 436220621, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (174, 436208152, '[
  436207760,
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (185, 436207728, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (195, 436220430, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (204, 436208134, '[
  436207744,
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (218, 436222089, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (224, 436216628, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (236, 444596226, '[
  444596325,
  444596326
]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (245, 16789466, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (254, 16789391, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (264, 452984836, '[]', true, 'cat4');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (275, 444609294, '[
  444596325
]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (284, 444609295, '[
  444596325
]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (294, 444608566, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (304, 452999691, '[]', true, 'cat4');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (113, 50343793, '[
  50343794,
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (122, 436208122, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (132, 50344191, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (141, 436208167, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (151, 436208139, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (161, 436221992, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (172, 436220443, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (182, 436220690, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (192, 50343957, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (205, 436220475, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (217, 444596326, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (228, 436220419, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (238, 444610869, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (251, 16789460, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (255, 16789512, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (269, 444609305, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (274, 444609293, '[
  444596325
]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (285, 444609118, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (297, 444608397, '[
  444596325
]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (308, 436219930, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (114, 50343784, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (124, 436207721, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (134, 436220477, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (143, 436220339, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (155, 436222079, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (164, 436208154, '[
  436207762,
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (175, 436219763, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (187, 436208145, '[
  436207717,
  436207755
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (194, 436208141, '[
  436207717,
  436207751
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (203, 436208127, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (213, 436220503, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (223, 436207750, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (234, 436208117, '[
  436207717,
  436207720
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (246, 444609117, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (259, 444608984, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (268, 444609229, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (281, 444610532, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (289, 444596225, '[
  444596325,
  444596326
]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (299, 452999249, '[]', true, 'cat4');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (115, 50343790, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (126, 436208146, '[
  436207717,
  436207756
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (135, 436208123, '[
  436207732,
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (147, 436220366, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (157, 436220481, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (166, 436220679, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (177, 436216707, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (184, 436207723, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (198, 436222109, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (209, 436220536, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (216, 436220743, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (227, 436208136, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (233, 436219646, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (243, 16777222, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (253, 444610695, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (263, 16789527, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (273, 444609292, '[
  444596325
]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (283, 444596325, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (293, 444610732, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (303, 436222475, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (116, 436216629, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (129, 436220292, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (144, 50344084, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (152, 436220480, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (163, 436208153, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (171, 436220754, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (181, 436220457, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (191, 436208165, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (200, 436220478, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (211, 444610600, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (219, 436207618, '[
  436207717,
  436207718
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (231, 436221467, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (240, 444596227, '[
  444596325
]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (248, 16789459, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (257, 16789736, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (266, 444609386, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (277, 444608570, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (286, 16789463, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (296, 444608508, '[
  444596325
]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (306, 444611037, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (117, 436208137, '[
  436207747,
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (127, 436208622, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (136, 50343931, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (142, 436219958, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (154, 436208138, '[
  436207748,
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (165, 436219796, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (173, 50343800, '[
  436207717,
  50343871
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (183, 436220725, '[
  436207717,
  436207718
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (197, 436219777, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (207, 436207620, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (214, 436207626, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (225, 436219639, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (235, 436217616, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (244, 444609287, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (258, 444608512, '[
  444596325
]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (271, 444609247, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (280, 444609111, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (290, 444610670, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (301, 452984843, '[]', true, 'cat4');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (118, 436207624, '[
  436207717,
  436207723
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (130, 436207627, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (138, 436220723, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (148, 436220363, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (158, 436207619, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (168, 436208143, '[
  436207717,
  436207753
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (178, 436220714, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (188, 436220661, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (201, 436208163, '[
  436207717,
  436207766
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (206, 436219858, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (215, 436208621, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (226, 436222373, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (239, 436208119, '[
  436207717,
  436207724
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (247, 444608504, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (260, 444609296, '[
  444596325
]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (265, 16789735, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (276, 444609291, '[
  444596325
]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (287, 444608451, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (295, 452997726, '[]', true, 'cat4');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (305, 444611076, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (119, 50344370, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (125, 50343874, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (137, 50343926, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (146, 436220665, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (156, 436220738, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (167, 436221967, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (176, 436220520, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (186, 436219857, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (193, 436222090, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (202, 436220479, '[
  436207717
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (212, 436207763, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (222, 436207617, '[
  436207717,
  436207718
]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (232, 436221469, '[]', true, 'cat2');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (242, 444596246, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (252, 16789523, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (262, 444609297, '[
  444596325
]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (272, 444609290, '[
  444596325
]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (279, 16789237, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (292, 444608503, '[]', true, 'cat3');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (302, 452997693, '[]', true, 'cat4');
INSERT INTO demo (id, catalog_id, ref_catalog_ids, active, category)
VALUES (309, 444608538, '[]', true, 'cat3');