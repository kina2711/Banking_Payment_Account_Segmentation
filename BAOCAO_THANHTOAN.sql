-- I. BÁO CÁO TÌNH HÌNH THANH TOÁN QUÝ I/2024

-- SỐ DƯ ĐẦU KỲ
SELECT 
  MONTH(actiondate) AS Thang,
  SUM(pre_balance) AS So_du_dau_ky
FROM 
(
    SELECT 
        casa_account,
        actiondate,
        pre_balance,
        ROW_NUMBER() OVER(PARTITION BY casa_account, MONTH(actiondate) ORDER BY actiondate) AS [RANK]
    FROM Transfer_history
) X
WHERE [RANK] = 1
AND MONTH(actiondate) IN (1, 2, 3)
GROUP BY MONTH(actiondate);

-- TIỀN RA
SELECT 
  MONTH(actiondate) AS Thang,
  SUM(decrease) AS Tien_ra
FROM Transfer_history
WHERE casa_account = Sent_account
AND destination_account != ''
AND MONTH(actiondate) IN (1, 2, 3)
GROUP BY MONTH(actiondate);

-- TIỀN VÀO
SELECT 
  MONTH(actiondate) AS Thang,
  SUM(increase) AS Tien_vao
FROM Transfer_history
WHERE casa_account = destination_account
AND Sent_account != ''
AND MONTH(actiondate) IN (1, 2, 3)
GROUP BY MONTH(actiondate);

-- RÚT TIỀN MẶT
SELECT 
  MONTH(actiondate) AS Thang,
  SUM(decrease) AS Rut_tien_mat
FROM Transfer_history
WHERE destination_account = ''
AND MONTH(actiondate) IN (1, 2, 3)
GROUP BY MONTH(actiondate);

-- NỘP TIỀN MẶT
SELECT 
  MONTH(actiondate) AS Thang,
  SUM(increase) AS Nop_tien_mat
FROM Transfer_history
WHERE Sent_account = ''
AND MONTH(actiondate) IN (1, 2, 3)
GROUP BY MONTH(actiondate);

-- SỐ DƯ CUỐI KỲ
SELECT 
  MONTH(actiondate) AS Thang,
  SUM(af_balance) AS So_du_cuoi_ky
FROM 
(
    SELECT 
        casa_account,
        actiondate,
        af_balance,
        ROW_NUMBER() OVER(PARTITION BY casa_account, MONTH(actiondate) ORDER BY actiondate DESC) AS [RANK]
    FROM Transfer_history
) X
WHERE [RANK] = 1
AND MONTH(actiondate) IN (1, 2, 3)
GROUP BY MONTH(actiondate);
