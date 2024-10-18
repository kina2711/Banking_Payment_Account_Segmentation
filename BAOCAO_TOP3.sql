SELECT TOP 3
	CUS.custid								AS [MÃ KHÁCH HÀNG]
	,IC.iccbrname								AS [CHI NHÁNH]
	,CUS.custname 								AS [TÊN KHÁCH HÀNG]
	,TH.casa_account							AS [TÀI KHOẢN CASA]
	,SUM(TH.increase) + SUM(decrease)					AS [TỔNG TIỀN GIAO DỊCH]
	,RANK() OVER (ORDER BY (SUM(TH.increase) + SUM(decrease)) DESC )	AS [RANK]
FROM TRANSFER_HISTORY AS TH
LEFT JOIN CUSTOMER AS CUS
ON TH.casa_account = CUS.casa_account
LEFT JOIN ICC_BRANCH AS IC
ON CUS.branch = IC.iccbrcode
GROUP BY
CUS.custid
,IC.iccbrname
,CUS.custname
,TH.casa_account
