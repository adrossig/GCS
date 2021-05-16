if IsRedM then
	
Imap = class()

function Imap:Request(hash)
	if IsFiveM then hash = GetHashKey(hash) end
	RequestImap(hash)
end


function Imap:Remove(hash)
	if IsFiveM then hash = GetHashKey(hash) end
	RemoveImap(hash)
end

function Imap:RequestAll()
	for _, hash in pairs(Imaps) do
		self:Request(hash)
	end
end

function Imap:RemoveAll()
	Citizen.CreateThread(function()
		for _, hash in pairs(Imaps) do
			self:Remove(hash)

			if _ % 50 == 0 then
				Wait(1)
			end
		end
	end)
end

-- https://github.com/MissBehavin/redm-ipl/blob/master/client.lua
function Imap:LoadValentine()
	Imap:Request(774477221) -- Valentine Sheriff's Office Crumbled Wall parts...
	Imap:Request(1097534152) -- Valentine Sheriffs Office Outer wall
	Imap:Request(-1158072415)
	Imap:Remove(2095116685) -- supplies/boxes in mainstreet front of General Store, Saloon, Green building
	Imap:Request(192173299) -- Valentine -- Support Beams and signs -- Mainstreet Saloon
	Imap:Request(903666582)
	Imap:Request(637874199) -- Valentine -- Green Building Lamp
	Imap:Request(-1521525254)  --Green House Valentine -- Exterior Trees and Flowers 1(Run 1 and 2 together)
	Imap:Request(-761186147)  --Green House Valentine -- Exterior Trees and Flowers 2(Run 1 and 2 together)
end

Imap = Imap()

Imaps = 
{
	1634621556,
	629362551,
	-947200121,
	-1305545118,
	1424082059,
	-1939038021,
	-1613805696,
	-1933338814,
	952753807,
	1963724330,
	-391187090,
	325677491,
	740012805,
	827241616,
	1236921921,
	1886602884,
	1998491982,
	-2022476576,
	-1902184438,
	-1745251995,
	-1036626590,
	-931084663,
	-237375888,
	-1171033418,
	-869788001,
	-487373767,
	-455342387,
	227706189,
	341106871,
	441668603,
	1435082664,
	-2091615427,
	-1997605640,
	-1374896333,
	-1324099905,
	-454287921,
	1208537422,
	2108112010,
	1298607560,
	-1142569437,
	-297340751,
	1823159188,
	422167750,
	621272158,
	801042892,
	82084523,
	204481342,
	706423733,
	767505137,
	995675696,
	1202346365,
	1289178060,
	1815262278,
	-1466172032,
	-1340001373,
	-981873755,
	-926795318,
	-848315456,
	-642132908,
	633503129,
	-1873685184,
	-1795618779,
	-947895270,
	-2116659774,
	-893624314,
	18956962,
	-329705198,
	980234126,
	181690478,
	-1792872817,
	-1325016116,
	276582710,
	774601424,
	1864768904,
	1977031606,
	-2090209059,
	-2072231077,
	-1765152778,
	-562289114,
	1534006738,
	1576931820,
	1891284833,
	-1296418825,
	-648893593,
	-376056363,
	-1892843345,
	1270535492,
	1412515639,
	1812999696,
	-502582154,
	241205019,
	146746575,
	401909047,
	-2000013034,
	-1366431554,
	-960136064,
	-1229109520,
	1284656212,
	251102376,
	-846230557,
	-1521525254,
	-1508467572,
	-1184151355,
	-889100155,
	2056145270,
	314111435,
	418666411,
	434145706,
	651621232,
	1266707689,
	1650694835,
	1965736001,
	-665583358,
	-559257162,
	-282972514,
	-64632667,
	979982112,
	1060557512,
	1424293412,
	1557076971,
	1913538153,
	-744260705,
	-592147003,
	-362403544,
	-2119625926,
	-1670453688,
	-743781837,
	474287981,
	858124023,
	867231253,
	1643535022,
	-1331012521,
	890107948,
	1153046408,
	446554495,
	-1583328312,
	-262959893,
	141366309,
	686601882,
	1861460906,
	-1376560316,
	-1253110600,
	-574078291,
	-325778628,
	979670262,
	1180439762,
	1277540472,
	-1017701936,
	31909846,
	1503442953,
	-1227807056,
	37622013,
	276427301,
	506519174,
	539464064,
	573576705,
	808313916,
	929504930,
	1122045165,
	1252084553,
	1314976319,
	1352837232,
	1499112197,
	1713296185,
	1849913721,
	1903066940,
	2123794495,
	2126897368,
	-2112989134,
	-2009032789,
	-1740687448,
	-1710969071,
	-1508256931,
	-1501864740,
	-1435884039,
	-1226654727,
	-1070814495,
	-995906750,
	-822172378,
	-817060178,
	-792399058,
	-780302065,
	-737812908,
	-563006151,
	-340009312,
	-248246131,
	-173548630,
	-108299713,
	262039053,
	132414998,
	882236853,
	1239191982,
	1548242606,
	-2060277385,
	-1928361302,
	-1850873053,
	-1192753172,
	-833696851,
	-482255714,
	-315113250,
	-236914211,
	-223199122,
	1283988553,
	1912754336,
	1916362667,
	-169261100,
	-76573194,
	-8749224,
	99679839,
	402954041,
	508853087,
	616706228,
	840395410,
	1280284302,
	1455068616,
	1726559781,
	1831175752,
	2118488614,
	-1993836161,
	-1885599866,
	-1725459238,
	-1670262487,
	-1287270695,
	-1279832420,
	-1235304557,
	-1069586228,
	-936204805,
	-754458705,
	-688744902,
	-195226224,
	-118171082,
	48202231,
	194103255,
	298607063,
	354638936,
	748846068,
	787640784,
	933157597,
	1117165375,
	1193231534,
	1199768352,
	1416094782,
	1542551103,
	1807258239,
	2006120810,
	2051336312,
	-1991979537,
	-1986775954,
	-1985868973,
	-1785392621,
	-1695492178,
	-1398290276,
	-1392793470,
	-1300575561,
	-1298966347,
	-1139312905,
	-1003150953,
	-985843618,
	-899261623,
	-663999418,
	-557729610,
	129717520,
	401043460,
	546408124,
	715920781,
	1014446371,
	1313890873,
	1344880374,
	1529455145,
	1620300964,
	1683033662,
	1733394134,
	1859330882,
	1971923782,
	-1923126393,
	-1872364931,
	-1419371417,
	-1232784731,
	-1199296193,
	-900541220,
	-643041038,
	-553189820,
	-482898935,
	-476377037,
	-367168072,
	-313259746,
	-290546285,
	499096137,
	556704039,
	561187138,
	705065993,
	857765025,
	859352269,
	1023328345,
	1466088082,
	1590446437,
	-2090647942,
	-2051019414,
	-1852056457,
	-1789074439,
	-368895393,
	-105596478,
	1647812004,
	-1967848432,
	-856826868,
	-792369764,
	-456215895,
	-170108806,
	263133813,
	1311508924,
	-1957607557,
	-1626434823,
	-1411225477,
	184476093,
	413309170,
	-615961815,
	249811747,
	292362182,
	807262958,
	1717286956,
	-1960392600,
	-1255088882,
	1128425273,
	1405502979,
	-1534019549,
	-1218790373,
	54402003,
	263152228,
	272490690,
	273551835,
	301693437,
	425205960,
	634920011,
	700821233,
	706203603,
	765343099,
	937192284,
	996571604,
	1236490949,
	1332067900,
	1694736240,
	1749727534,
	1936009597,
	2035758463,
	-2053475031,
	-1923021027,
	-1721168110,
	-1701626270,
	-1686018814,
	-1569624057,
	-1532323601,
	-1421367329,
	-1118337851,
	-1055748784,
	-961488528,
	-909306169,
	-879315604,
	-694809996,
	-623091266,
	-557964826,
	-512601161,
	-481093102,
	-425834853,
	-378395191,
	-313831898,
	-279703229,
	-264544271,
	-217646849,
	660686456,
	661576070,
	739805687,
	795060201,
	965020136,
	983546059,
	992791293,
	1003623269,
	1113693078,
	1152711101,
	1226587137,
	1289304923,
	1351415411,
	1420094515,
	1452121614,
	1489268640,
	1588196653,
	1590561203,
	1638937672,
	2028590076,
	-2019993676,
	-1815023148,
	-1636879249,
	-1513941904,
	-1513106169,
	-1344255754,
	-1306375743,
	-1249930911,
	-1106668087,
	-924329535,
	-889869458,
	-584714922,
	-578640396,
	-323126593,
	-198004806,
	-78852126,
	1575123584,
	-710506752,
	-537757838,
	41398635,
	41956969,
	44502487,
	108234184,
	117485200,
	255767990,
	297811726,
	339295570,
	360408116,
	462263849,
	495287642,
	519905064,
	528036139,
	629519239,
	636278554,
	642301973,
	668976634,
	672931117,
	767935454,
	775893260,
	806681228,
	927020127,
	968084866,
	977037457,
	991016631,
	1008375999,
	1025787994,
	1031662866,
	1036815507,
	1051160751,
	1053919002,
	1069611813,
	1102643191,
	1104800593,
	1108743226,
	1122583474,
	1138093977,
	1182205549,
	1221694281,
	1263244828,
	1271713904,
	1275396762,
	1293624693,
	1311984381,
	1358414393,
	1358443339,
	1364276294,
	1368296489,
	1388161943,
	1418284080,
	1422134667,
	1423158124,
	1423681694,
	1459136338,
	1491306978,
	1492183352,
	1537844205,
	1547347496,
	1614255891,
	1694722333,
	1754442555,
	1792084900,
	1880729016,
	1929440211,
	1976770232,
	1983816160,
	1999019061,
	2117211184,
	2140528435,
	2144414063,
	-2117963426,
	-2105936269,
	-2048221620,
	-2047539266,
	-2042475701,
	-1966238128,
	-1960338341,
	-1869016398,
	-1848077772,
	-1832103801,
	-1813544782,
	-1802418799,
	-1786365097,
	-1778044697,
	-1766409506,
	-1754970007,
	-1718055184,
	-1680050035,
	-1541842872,
	-1499162505,
	-1496155572,
	-1437554707,
	-1305406402,
	-1260153352,
	-1194012756,
	-1162254606,
	-1063926197,
	-1063259251,
	-1042390616,
	-1041976064,
	-1016007592,
	-1005727867,
	-981684452,
	-974404379,
	-974260253,
	-957510885,
	-854053607,
	-835014781,
	-833857740,
	-831409346,
	-828094297,
	-771819139,
	-763678874,
	-724913398,
	-696422730,
	-661835039,
	-624201308,
	-622475043,
	-558965494,
	-483001024,
	-470270956,
	-459648718,
	-436084091,
	-419935200,
	-408234235,
	-407402757,
	-332895402,
	-329355129,
	-317096325,
	-285245562,
	-262759679,
	-227646388,
	-226773579,
	-198101911,
	-162051503,
	-149795084,
	-118700196,
	-76700394,
	-37875204,
	-7594117,
	-3789307,
	2470511,
	23211744,
	30201771,
	56708243,
	73781828,
	75758162,
	84505049,
	116162819,
	135886022,
	192173299,
	199047531,
	203916786,
	207962241,
	255234871,
	267578156,
	317070801,
	339111695,
	355534527,
	406334892,
	422895856,
	453346329,
	517553365,
	610256856,
	634831342,
	637874199,
	666617953,
	696143352,
	723280965,
	724436573,
	766024860,
	774915424,
	782453481,
	805009584,
	849000236,
	858391795,
	897455211,
	899515759,
	903666582,
	918349577,
	924412185,
	931225480,
	944314155,
	951314072,
	999248445,
	1027093524,
	1057962148,
	1081087978,
	1097534152,
	1104143966,
	1136898294,
	1186533019,
	1190000937,
	1202020135,
	1210380353,
	1274066881,
	1274804496,
	1285430299,
	1314449010,
	1324480450,
	1325716092,
	1345512955,
	1385025009,
	1405104937,
	1432023115,
	1460466036,
	1477302955,
	1500116524,
	1531008020,
	1573766063,
	1579100372,
	1585258492,
	1596089211,
	1624069429,
	1651555923,
	1672215059,
	1708195603,
	1733948592,
	1777348822,
	1804593020,
	1817635528,
	1855900423,
	1879779330,
	1891601353,
	1903595390,
	2040843256,
	2075691867,
	2085996057,
	2120696181,
	2125514970,
	2133280389,
	-2133417899,
	-2112398481,
	-2106432785,
	-2083943324,
	-2017926221,
	-2009766528,
	-1989899190,
	-1950611003,
	-1933617196,
	-1905652203,
	-1892595931,
	-1878882174,
	-1871745961,
	-1824080033,
	-1809571159,
	-1801047945,
	-1792927116,
	-1781246069,
	-1773409329,
	-1744253204,
	-1632398420,
	-1617847332,
	-1598817635,
	-1588793465,
	-1579403437,
	-1490048714,
	-1475403379,
	-1465375517,
	-1448445780,
	-1336734446,
	-1324424825,
	-1301569116,
	-1265903940,
	-1233192626,
	-1217078386,
	-1177027698,
	-1132206051,
	-1132062910,
	-1112373128,
	-1052023588,
	-1049500949,
	-1000738568,
	-991619789,
	-981203673,
	-964333056,
	-943891161,
	-933272993,
	-914406102,
	-911405738,
	-900583649,
	-898648545,
	-892659042,
	-891994084,
	-799526632,
	-791673850,
	-784156210,
	-780819048,
	-776975047,
	-763477089,
	-745087561,
	-713587740,
	-711890106,
	-661560211,
	-657241692,
	-622262900,
	-617637362,
	-614415607,
	-568364335,
	-560409108,
	-555917871,
	-554932707,
	-532404410,
	-528294019,
	-518858513,
	-518785376,
	-518524915,
	-508205317,
	-474761969,
	-432370325,
	-355725899,
	-350513342,
	-282483003,
	-267240804,
	-253786834,
	-229423815,
	-205505701,
	-159723514,
	-156313117,
	-84516711,
	-52140817,
	-51262018,
	-24665995,
	26932594,
	46370274,
	98482444,
	215445135,
	331055837,
	350637317,
	382484708,
	499044444,
	510716616,
	563581773,
	691955519,
	731403475,
	746475990,
	777001839,
	820079465,
	890452998,
	920427419,
	976641588,
	1118349790,
	1121956769,
	1157155867,
	1179876988,
	1364392658,
	1424964403,
	1464851585,
	1474506566,
	1492058366,
	1502426964,
	1525792358,
	1628851253,
	1750312025,
	1763246099,
	1968676233,
	2030269157,
	2080640229,
	2112594812,
	-2118247833,
	-1930879809,
	-1853595822,
	-1835067413,
	-1754541271,
	-1625703283,
	-1404010179,
	-1392150519,
	-1386614896,
	-1363999915,
	-1152621397,
	-1111286486,
	-1109901848,
	-1045062790,
	-1022518533,
	-1010679388,
	-910880980,
	-882460089,
	-853741653,
	-820486040,
	-805522215,
	-794503195,
	-787042507,
	-753844687,
	-724540003,
	-693812694,
	-615794465,
	-591921971,
	-561599737,
	-555736180,
	-543171902,
	-437187151,
	-411006854,
	-389510791,
	-340622004,
	-307327135,
	-246228912,
	-210971682,
	-200959126,
	-196117122,
	-175713561,
	-163883900,
	-163787010,
	-142900294,
	-103025626,
	82327632,
	124419381,
	334535013,
	539566709,
	582879672,
	585407854,
	934782463,
	1091543855,
	1169511062,
	1192526031,
	1202625130,
	1253364275,
	1381573999,
	1517736440,
	1584946069,
	1713454259,
	1798244378,
	1912921446,
	2116125345,
	2123010634,
	-2111718052,
	-2050529045,
	-2035177903,
	-1984145124,
	-1881083919,
	-1653831205,
	-1584316325,
	-1509154451,
	-1436313374,
	-1417469821,
	-1369880946,
	-1315256079,
	-1310914542,
	-1272426249,
	-1266106154,
	-1176501741,
	-1147247388,
	-1085363933,
	-1081335485,
	-1055775145,
	-957163823,
	-952533419,
	-693132475,
	-574996782,
	-537740003,
	-505092091,
	-276247702,
	-208302420,
	-87516051,
	5422464,
	33260939,
	43335376,
	44077654,
	66523468,
	77337110,
	79028136,
	83970131,
	131323483,
	176369335,
	180676027,
	182702483,
	190341238,
	197447134,
	203845253,
	258733332,
	258899919,
	270920361,
	275588949,
	277394743,
	339409162,
	349494711,
	411742897,
	413528085,
	429636242,
	446073162,
	449426161,
	480644817,
	500829173,
	531960211,
	537424819,
	552549522,
	578474998,
	611701601,
	634752926,
	637627640,
	647011769,
	695570510,
	703356498,
	727408145,
	749968899,
	751578549,
	780653384,
	838684496,
	839872819,
	862349416,
	901412334,
	908264395,
	910783469,
	931647489,
	945532872,
	949366910,
	966418260,
	984271748,
	993595204,
	1001532087,
	1068490648,
	1190076410,
	1190549596,
	1204787444,
	1205945639,
	1236917971,
	1256771838,
	1259264494,
	1291083725,
	1299817544,
	1417317522,
	1444950942,
	1467774743,
	1525054056,
	1529593482,
	1532774697,
	1598834669,
	1659037747,
	1681117196,
	1732747121,
	1757739778,
	1818602127,
	1819926822,
	1892122519,
	1901132483,
	1924458218,
	1934919499,
	1953646620,
	1967278288,
	2006257967,
	2029194243,
	2030594491,
	2038589758,
	2040259178,
	2087181890,
	2111816145,
	2131035495,
	-2131457946,
	-2093605706,
	-2082345587,
	-2043326480,
	-2008632686,
	-2000794023,
	-1986209836,
	-1956194332,
	-1860722801,
	-1784133719,
	-1696865897,
	-1667461262,
	-1658679165,
	-1656895602,
	-1615103170,
	-1613262779,
	-1548753996,
	-1439987356,
	-1390242353,
	-1387511711,
	-1355464862,
	-1311758334,
	-1306905398,
	-1141450523,
	-1126224181,
	-1125782227,
	-1106517275,
	-1073832871,
	-1012618146,
	-999913940,
	-974480336,
	-960328988,
	-956131204,
	-918785150,
	-904669171,
	-890895654,
	-803019223,
	-794515291,
	-793172630,
	-790660125,
	-767883927,
	-744634306,
	-715865581,
	-706105482,
	-692583342,
	-669282002,
	-668911501,
	-588668690,
	-584332967,
	-583969090,
	-535715562,
	-531137142,
	-515396642,
	-515384620,
	-496874464,
	-432154242,
	-392430949,
	-364121869,
	-316448350,
	-276232022,
	-273633290,
	-252820785,
	-242247633,
	-218940381,
	-211623797,
	-187892725,
	-186143124,
	-138066405,
	-134556459,
	-130638369,
	-114633341,
	-90646166,
	-52330434,
	-30541382,
	-19364596,
	42081460,
	65255897,
	71064384,
	94051462,
	106249677,
	114673428,
	118201723,
	123244896,
	135073157,
	138913863,
	140744122,
	163126540,
	172011504,
	207396248,
	213881095,
	232965437,
	247622608,
	248271199,
	271879652,
	281153830,
	281369603,
	288413571,
	300556693,
	300868838,
	321670654,
	324486076,
	327932996,
	338623029,
	360721137,
	382730224,
	384146021,
	390537034,
	394987827,
	398639187,
	409171062,
	411846009,
	427220750,
	437660121,
	458453080,
	478657470,
	490626364,
	504746979,
	512556003,
	532770666,
	551283532,
	558651865,
	586903821,
	592304845,
	607173790,
	607574432,
	629133609,
	658099812,
	663898893,
	685855865,
	690962168,
	711016796,
	728120284,
	736578607,
	739412171,
	748023752,
	758066107,
	765141292,
	773056734,
	780406120,
	780539316,
	823583740,
	825179479,
	826510327,
	857341300,
	870580095,
	872406077,
	894198124,
	898257133,
	905216692,
	917434281,
	937052178,
	943845492,
	948877318,
	957052101,
	970919580,
	970924250,
	971859818,
	976283842,
	977328128,
	980904027,
	994786977,
	998966461,
	1029415554,
	1029525997,
	1079303588,
	1103365569,
	1106136910,
	1108342912,
	1111220101,
	1111495201,
	1120159358,
	1157066259,
	1173561253,
	1182222803,
	1189709192,
	1189885824,
	1202333215,
	1210622903,
	1213339434,
	1219098211,
	1219276914,
	1240323378,
	1244293311,
	1251358153,
	1251859782,
	1258244391,
	1268291329,
	1269600821,
	1311336125,
	1327622980,
	1343343014,
	1351589798,
	1359061265,
	1361745480,
	1366418802,
	1370097763,
	1372565859,
	1381006186,
	1423450469,
	1434945142,
	1444269207,
	1453569688,
	1454866069,
	1457661960,
	1471226731,
	1475953931,
	1490756544,
	1520095560,
	1526869387,
	1542953700,
	1546110128,
	1548546221,
	1552753100,
	1560807181,
	1570711734,
	1620292759,
	1634548877,
	1705957630,
	1707393029,
	1720188956,
	1739101350,
	1749008611,
	1771740581,
	1780324332,
	1782877577,
	1785810071,
	1808508475,
	1811369374,
	1822607116,
	1831662563,
	1840600379,
	1858796535,
	1879160410,
	1905713232,
	1943484686,
	1948051928,
	1957225320,
	1987335384,
	1998041523,
	2002353235,
	2015311123,
	2019747962,
	2022451711,
	2043415841,
	2047954825,
	2056603274,
	2060831702,
	2070855168,
	2077623691,
	2082890965,
	2096286828,
	2097700639,
	2101101756,
	2136811572,
	-2142583869,
	-2128076937,
	-2125611324,
	-2122914678,
	-2104773585,
	-2085723453,
	-2084193212,
	-2077690059,
	-2052582076,
	-2045964586,
	-2040493861,
	-2037661155,
	-2037324418,
	-2016526173,
	-1995054197,
	-1991600114,
	-1987982797,
	-1971474291,
	-1962893335,
	-1960936248,
	-1959752936,
	-1954657946,
	-1954500791,
	-1945901045,
	-1933895237,
	-1926989471,
	-1926787493,
	-1916602073,
	-1893724593,
	-1884481178,
	-1877706739,
	-1859373348,
	-1854368742,
	-1852293718,
	-1843275034,
	-1818172530,
	-1788578071,
	-1736664016,
	-1730383387,
	-1703972708,
	-1687561002,
	-1623126047,
	-1620486708,
	-1611076340,
	-1610993260,
	-1593160175,
	-1588838395,
	-1576393943,
	-1563072795,
	-1560816708,
	-1559513478,
	-1559012672,
	-1490939730,
	-1472352094,
	-1471527776,
	-1445249981,
	-1445186253,
	-1433138716,
	-1426249148,
	-1425946870,
	-1397986140,
	-1394364678,
	-1393565861,
	-1392106138,
	-1385360243,
	-1382265257,
	-1381094502,
	-1380983970,
	-1365193577,
	-1325803862,
	-1321905459,
	-1299414622,
	-1288790000,
	-1260156441,
	-1256588921,
	-1223572965,
	-1208355109,
	-1191639377,
	-1177590512,
	-1150137955,
	-1149736196,
	-1127520408,
	-1123141803,
	-1114426126,
	-1103841944,
	-1075177706,
	-1065081444,
	-1063247873,
	-1035166057,
	-1031045988,
	-1019662642,
	-997730118,
	-989624007,
	-971625396,
	-948615309,
	-942555699,
	-937893311,
	-927211837,
	-925280991,
	-860696938,
	-855912354,
	-838184752,
	-826493765,
	-826466486,
	-824341862,
	-821741560,
	-817579246,
	-774610462,
	-770240157,
	-760097927,
	-754870430,
	-753454183,
	-745860880,
	-741769242,
	-714433281,
	-710911638,
	-699389755,
	-688011628,
	-665831452,
	-643541706,
	-634291786,
	-630275010,
	-621941030,
	-613113483,
	-601173298,
	-593183975,
	-590227673,
	-586415580,
	-584027313,
	-574138996,
	-539928451,
	-520400509,
	-518004776,
	-515910704,
	-501793326,
	-442857872,
	-441619793,
	-413795019,
	-402976431,
	-393583941,
	-380287375,
	-379409079,
	-378913462,
	-372970556,
	-368021021,
	-365969388,
	-362883443,
	-355608501,
	-354071784,
	-346527162,
	-316909020,
	-315098753,
	-305724672,
	-302735166,
	-293283707,
	-268335331,
	-233399915,
	-232598845,
	-223906810,
	-186281506,
	-182995231,
	-164693058,
	-159819388,
	-124494382,
	-123674550,
	-102951407,
	-90108678,
	-80564929,
	-65072454,
	-15722296,
	-5339556,
	2728487,
	5585502,
	13279687,
	15472829,
	17042536,
	40009123,
	45121961,
	54661488,
	58066174,
	59954835,
	61246072,
	67198036,
	68640791,
	82769080,
	83602522,
	85381493,
	92080743,
	93121605,
	102652153,
	107317036,
	110400393,
	126970802,
	134788573,
	157361403,
	159921796,
	170282000,
	177032169,
	180356041,
	188985281,
	202127432,
	209919309,
	216214729,
	220012076,
	220566669,
	232704285,
	266022415,
	286801141,
	289521398,
	289923401,
	291770965,
	291880860,
	292845400,
	298954243,
	313722477,
	339345820,
	349486662,
	349896400,
	363257921,
	372239195,
	414622870,
	419559004,
	438624963,
	439855383,
	481636996,
	482931525,
	483731764,
	495480888,
	499090815,
	510052409,
	514406510,
	516817794,
	530288130,
	539843907,
	557551306,
	562620119,
	592696807,
	612040624,
	614556127,
	622597018,
	643415268,
	648514907,
	652735549,
	702350293,
	715730031,
	716331350,
	719147410,
	719400048,
	746194903,
	758684739,
	764763647,
	767293177,
	767843012,
	773757120,
	778703691,
	794749213,
	809554858,
	810684093,
	827269092,
	827689360,
	828093818,
	853723410,
	854689865,
	856120107,
	869642051,
	870974221,
	884576413,
	901520480,
	901975752,
	906570755,
	910941329,
	912202325,
	923572416,
	945502524,
	964593693,
	976082270,
	977061573,
	990134505,
	1003223945,
	1013712166,
	1027586707,
	1028224932,
	1033721560,
	1034009086,
	1048790253,
	1048845581,
	1049842342,
	1070723367,
	1074130180,
	1079213989,
	1084869405,
	1096093290,
	1125807846,
	1127014190,
	1128417383,
	1132471666,
	1134615168,
	1149195254,
	1155877447,
	1169958167,
	1175400068,
	1193480106,
	1209017192,
	1210820782,
	1238930250,
	1241926587,
	1246210400,
	1251925821,
	1253360932,
	1261237250,
	1265596420,
	1272609317,
	1279910772,
	1309652195,
	1335714585,
	1343484786,
	1351016737,
	1358881158,
	1386355334,
	1393010249,
	1396808929,
	1401474740,
	1402472902,
	1403324282,
	1404611977,
	1426715569,
	1448230281,
	1461000451,
	1465430690,
	1467687992,
	1495126173,
	1529136698,
	1538837441,
	1547994518,
	1567139024,
	1570711119,
	1570727704,
	1578454569,
	1588507579,
	1594957399,
	1601599776,
	1601820048,
	1603294144,
	1609975546,
	1620317782,
	1632534041,
	1636281938,
	1648013752,
	1649275138,
	1653690202,
	1662136507,
	1674493966,
	1676971154,
	1677041346,
	1679038623,
	1680444835,
	1687083522,
	1691578074,
	1692451176,
	1697710256,
	1700045179,
	1700234797,
	1700661865,
	1706275010,
	1706509616,
	1717489303,
	1718863943,
	1721842998,
	1724935027,
	1729014506,
	1734859244,
	1737389826,
	1742990618,
	1751711892,
	1769061820,
	1772877245,
	1802911979,
	1810083187,
	1833824812,
	1871051363,
	1880827833,
	1881774051,
	1882605165,
	1883534212,
	1886481528,
	1907352897,
	1915768280,
	1926336063,
	1928252407,
	1936473519,
	1944013855,
	1952267752,
	1956790299,
	1979295273,
	1988923494,
	1989074279,
	1996801454,
	1997423854,
	2004706822,
	2016081133,
	2017155697,
	2017271733,
	2025485344,
	2036492390,
	2047806036,
	2057239183,
	2061467757,
	2072112547,
	2076873943,
	2084338579,
	2097480406,
	2101399188,
	2107657444,
	2108368013,
	2116967107,
	2119205605,
	2119466214,
	2123887232,
	-2147051362,
	-2143243848,
	-2137633069,
	-2111123884,
	-2093572127,
	-2082218688,
	-2080981458,
	-2080794226,
	-2066612507,
	-2054476413,
	-2029001482,
	-2023595928,
	-2016771661,
	-2014929982,
	-2008992782,
	-2001921071,
	-2000217623,
	-2000080725,
	-1999825729,
	-1999465365,
	-1983416665,
	-1943471541,
	-1924933663,
	-1910456812,
	-1906732332,
	-1894946791,
	-1887167048,
	-1880340209,
	-1872939092,
	-1842411116,
	-1841279810,
	-1836870707,
	-1828030290,
	-1821269135,
	-1799943886,
	-1774140220,
	-1754422016,
	-1747868160,
	-1739900853,
	-1739164071,
	-1728638189,
	-1676997321,
	-1676256391,
	-1671953459,
	-1663177928,
	-1656565547,
	-1656481590,
	-1656346086,
	-1643869063,
	-1642249622,
	-1639921686,
	-1634149975,
	-1622723192,
	-1619008260,
	-1618574684,
	-1588759076,
	-1578156975,
	-1570232590,
	-1562347907,
	-1561108232,
	-1552695732,
	-1507376753,
	-1484530238,
	-1468033039,
	-1466334531,
	-1466175146,
	-1458944281,
	-1452926611,
	-1451784475,
	-1439534945,
	-1436188587,
	-1434077648,
	-1405375965,
	-1404018434,
	-1397680620,
	-1395712024,
	-1392451243,
	-1390612743,
	-1389718656,
	-1388202749,
	-1386423483,
	-1382351182,
	-1378006849,
	-1377139506,
	-1370620659,
	-1362716862,
	-1341918262,
	-1331617405,
	-1331593143,
	-1323936218,
	-1292493167,
	-1291679096,
	-1284301817,
	-1279618207,
	-1276109918,
	-1269206370,
	-1250617063,
	-1240445886,
	-1232260252,
	-1218507547,
	-1206781161,
	-1190435787,
	-1176903838,
	-1176057358,
	-1159690567,
	-1156834741,
	-1152479731,
	-1147256587,
	-1130111983,
	-1123811713,
	-1115840558,
	-1089984175,
	-1070054959,
	-1062918766,
	-1045678888,
	-1037436240,
	-1036501021,
	-1033632314,
	-1023331176,
	-1015572514,
	-1010466481,
	-1009723068,
	-1003800955,
	-997495998,
	-989202374,
	-984168982,
	-964156415,
	-963708270,
	-960337247,
	-959814975,
	-958046355,
	-948006506,
	-916538063,
	-910918420,
	-891504611,
	-886310806,
	-882188392,
	-880373663,
	-877653131,
	-873889071,
	-872749010,
	-872587325,
	-850189983,
	-814821283,
	-810270260,
	-809371454,
	-800534102,
	-792944828,
	-789852154,
	-782359587,
	-780636043,
	-779765183,
	-774570734,
	-759698431,
	-753535900,
	-751959361,
	-750963311,
	-714662377,
	-708550718,
	-692521236,
	-688890765,
	-687151759,
	-677977650,
	-661825463,
	-646014955,
	-644575724,
	-638481378,
	-624219879,
	-621187540,
	-619637948,
	-597695075,
	-582128423,
	-558920293,
	-555683060,
	-554880142,
	-546137515,
	-538645000,
	-537753136,
	-531884362,
	-520163372,
	-498256840,
	-492479795,
	-490818122,
	-485651612,
	-468702164,
	-462274808,
	-437251660,
	-436009554,
	-421730990,
	-415514741,
	-414377604,
	-412827149,
	-406964748,
	-387018143,
	-385999832,
	-383442850,
	-347518940,
	-337712376,
	-327708229,
	-320577790,
	-313992757,
	-276524767,
	-262271608,
	-254947417,
	-247188415,
	-239872503,
	-207952982,
	-205043526,
	-192167630,
	-184821200,
	-172246728,
	-166639526,
	-164470157,
	-160392273,
	-159557995,
	-158824350,
	-146943962,
	-134624703,
	-131920506,
	-112364237,
	-109593135,
	-109425099,
	-105525329,
	-98843293,
	-90228526,
	-87826930,
	-71508135,
	-70021332,
	-54044677,
	-31847670,
	-21876618,
	-526829,
	54029413,
	68538405,
	96746001,
	137316925,
	142459882,
	143811737,
	146172383,
	148905841,
	149553684,
	156108889,
	160952444,
	165972019,
	175578406,
	191078900,
	195206081,
	206289712,
	281772765,
	291732199,
	305999638,
	343067600,
	350100475,
	396094389,
	432272547,
	481139295,
	489834626,
	490883533,
	496889556,
	535384482,
	580700069,
	594995975,
	604920544,
	619024057,
	638730219,
	695709062,
	728046625,
	752665876,
	808576710,
	814527571,
	821233769,
	826576088,
	876228895,
	881979872,
	913995529,
	942470447,
	943998860,
	995510724,
	1017355491,
	1048677741,
	1078633574,
	1082980257,
	1088045886,
	1112455558,
	1136457806,
	1137646647,
	1157695860,
	1160690623,
	1193981581,
	1205820933,
	1255880931,
	1263227745,
	1305074360,
	1344912657,
	1347068672,
	1355914142,
	1382135686,
	1394163483,
	1395510290,
	1405627586,
	1417687142,
	1461266126,
	1473876796,
	1483720641,
	1509141447,
	1520435387,
	1547403545,
	1628286919,
	1676972066,
	1679182807,
	1710784888,
	1724413302,
	1726243396,
	1731058187,
	1758966416,
	1762912664,
	1767170589,
	1821956151,
	1826022799,
	1850497361,
	1859948183,
	1871261290,
	1895127686,
	1905310584,
	1946327170,
	1949854427,
	1978008114,
	2015532863,
	2033090463,
	-2124415277,
	-2096572276,
	-2096145578,
	-2084311522,
	-2035101386,
	-1995815064,
	-1993960878,
	-1986089134,
	-1970628590,
	-1968130469,
	-1964958309,
	-1921438305,
	-1901860833,
	-1889108254,
	-1883922051,
	-1859413313,
	-1810665781,
	-1798259416,
	-1792518688,
	-1765467031,
	-1762770596,
	-1737485501,
	-1725465949,
	-1716205818,
	-1688366042,
	-1678761663,
	-1674702874,
	-1667265438,
	-1593790123,
	-1583923165,
	-1552239996,
	-1544199461,
	-1490034522,
	-1473336090,
	-1461530058,
	-1366130296,
	-1360840312,
	-1269989522,
	-1267247536,
	-1231099416,
	-1225383143,
	-1115403626,
	-1078577926,
	-1070234238,
	-1036688493,
	-1026473536,
	-1013403664,
	-1009052202,
	-1004522372,
	-931280709,
	-929277449,
	-920505696,
	-898081380,
	-873881483,
	-867062803,
	-801609437,
	-800942395,
	-782601262,
	-775951892,
	-771786794,
	-741366935,
	-739754595,
	-730093764,
	-724225587,
	-723094901,
	-704461521,
	-686953321,
	-677790400,
	-670748311,
	-660075384,
	-649684925,
	-643411908,
	-626641013,
	-614421509,
	-596723840,
	-595698218,
	-595652100,
	-574012528,
	-540286923,
	-531219857,
	-516683274,
	-508488230,
	-494733971,
	-483649675,
	-473077489,
	-469909433,
	-468635897,
	-445068262,
	-436566493,
	-390151116,
	-385790791,
	-359734366,
	-342806042,
	-278745837,
	-276259505,
	-274080837,
	-205116461,
	-74986722,
	-41173958,
	-30157790,
	105236016,
	158063004,
	391022529,
	526763180,
	928528900,
	1100939270,
	1173232190,
	1184975829,
	1186551862,
	1290812287,
	1589841939,
	1713084298,
	1736386364,
	1802967124,
	1870870569,
	2079207010,
	-2118853492,
	-2071756699,
	-1999121340,
	-1912028958,
	-1838419604,
	-1781758360,
	-1537525865,
	-1113878850,
	-1112692383,
	-1081428331,
	-626724117,
	-598586662,
	-597126658,
	-527717905,
	729601893,
	739567292,
	1128276345,
	1706906210,
	1873580721,
	-1532653291,
	362691319,
	2094371528,
	25328693,
	32078073,
	34346755,
	49766757,
	112916013,
	161441935,
	202086482,
	257582350,
	283792179,
	364962188,
	472339111,
	482102371,
	491871729,
	499759871,
	503623514,
	556610581,
	574303518,
	669655585,
	689576469,
	705321299,
	712371053,
	752030550,
	777139631,
	810861390,
	833006712,
	864734042,
	1007204499,
	1011350990,
	1049317994,
	1064781173,
	1065585604,
	1123990218,
	1309948033,
	1311675667,
	1427317659,
	1473078398,
	1557698400,
	1688216398,
	1710282603,
	1756181464,
	1857654366,
	1898267848,
	1934461192,
	1941336822,
	2087785010,
	2095655613,
	2096260998,
	2116024182,
	-2145836225,
	-2110850686,
	-2060408070,
	-1988266124,
	-1941005496,
	-1802096589,
	-1769481304,
	-1750010031,
	-1745210725,
	-1725439174,
	-1622834706,
	-1603458673,
	-1587527292,
	-1519499946,
	-1484676996,
	-1461922204,
	-1443390498,
	-1438901569,
	-1434912930,
	-1394479903,
	-1325390493,
	-1268841107,
	-1142062162,
	-1122265410,
	-1096712211,
	-1078418763,
	-1029093195,
	-1015857194,
	-935952905,
	-922302054,
	-895099271,
	-820561187,
	-816857367,
	-786679704,
	-772691681,
	-752772715,
	-722949619,
	-596115807,
	-562117679,
	-535498894,
	-502343927,
	-482127039,
	-415281478,
	-407026996,
	-280121448,
	-279038963,
	-278806915,
	-262371610,
	-175048740,
	-161271585,
	-107741771,
	-72482077,
	-58196573,
	-39730787,
	143994875,
	516308968,
	1308321372,
	-449454773,
	677191274,
	1145227353,
	1915867459,
	1991621063,
	1998087725,
	-2011620387,
	-1798733774,
	-1314125880,
	-953275122,
	-778771211,
	-312774935,
	-3571233,
	274045919,
	552030279,
	628834415,
	874022542,
	1340215842,
	1527084472,
	1635537886,
	-2043689068,
	-1639384288,
	-1412508605,
	-1121783372,
	-1130969794,
	-1047394327,
	-1141831946,
	-860750371,
	1193359531,
	-1624034435,
	40845437,
	1033367448,
	1707200698,
	1717399635,
	-1816233372,
	-1279036865,
	-718318645,
	-1664053323,
	-1535282356,
	-363626454,
	-358222847,
	112266538,
	520748015,
	658964321,
	781058494,
	1193229750,
	-2041779893,
	-1375030991,
	-1022426685,
	-697003681,
	-593457329,
	508609802,
	841781567,
	1020450527,
	1467466015,
	1989203268,
	-531198053,
	-484929865,
	1096363294,
	1262164851,
	1357705776,
	2006850489,
	-1453850836,
	-755250900,
	-620856989,
	-134240999,
	334010167,
	376665102,
	883152450,
	1331438832,
	1736837788,
	1814624585,
	-928815382,
	-676881895,
	-299265919,
	603871447,
	205214733,
	624282380,
	-846371468,
	-78801135,
	26544760,
	222513322,
	461989174,
	1216075674,
	1696372169,
	2100012223,
	-1316886711,
	-270704741,
	591001924,
	-2092712551,
	-1758697759,
	-1595003151,
	-1528647119,
	-1307469679,
	-1207658444,
	-890900091,
	1504707100,
	1049886174,
	1208592031,
	1479152994,
	1644962309,
	1947806010,
	2129660496,
	-2076388321,
	-149223920,
	-645247737,
	-604091710,
	375693548,
	211812479,
	551513105,
	642296010,
	832608336,
	1416512144,
	-400238535,
	67497998,
	-866774384,
	-687283562,
	-1578471167,
	-991895362,
	-846479900,
	-693659956,
	723786870,
	927290876,
	1193151399,
	2026630914,
	-2137016051,
	-2131576785,
	-1353871107,
	-975154818,
	-367425300,
	-225844616,
	-97116080,
	131702782,
	352739809,
	516107115,
	536560689,
	568859874,
	574916087,
	722896594,
	806606916,
	815958096,
	848190976,
	905895682,
	1083754485,
	1096335200,
	1106131202,
	1199250380,
	1216579993,
	1251554503,
	1283630779,
	1288855827,
	1303859698,
	1307857318,
	1425800019,
	1532789536,
	1551178888,
	1673463331,
	1779169712,
	1793712122,
	1857676106,
	1916363327,
	1926231273,
	1951742298,
	1960643951,
	2001473838,
	2087316443,
	2137579614,
	-2145807603,
	-2025289364,
	-2004293616,
	-1954638951,
	-1834690693,
	-1508001532,
	-1428524966,
	-1406112982,
	-1389022397,
	-1364906332,
	-1358954864,
	-1279389329,
	-936524034,
	-872975316,
	-752947810,
	-724513114,
	-657334314,
	-588218319,
	-583431154,
	-476328287,
	-387074757,
	-377841051,
	-313167137,
	-270131786,
	-199228359,
	-186728578,
	-70959366,
	11141848,
	67603480,
	87946549,
	104172940,
	272864959,
	295117400,
	353008762,
	405359977,
	503099916,
	616635225,
	743168245,
	908136834,
	953570968,
	999671710,
	1098358070,
	1108419054,
	1153240916,
	1211453192,
	1277031798,
	1364667248,
	1424952082,
	1497923922,
	1508981319,
	1657354548,
	1665904081,
	1991561012,
	-2143372379,
	-2054468361,
	-2001856298,
	-1916642580,
	-1871896679,
	-1818498296,
	-1774606389,
	-1765524972,
	-1754697240,
	-1399009137,
	-1353663029,
	-1279448947,
	-1058872649,
	-1051551519,
	-983957271,
	-973153750,
	-946682429,
	-901084182,
	-847027479,
	-781631997,
	-736226816,
	-697261290,
	-680105331,
	-655349451,
	-590242693,
	-536919806,
	-507080758,
	-394475958,
	-274311999,
	-252982535,
	-25254585,
	42616763,
	120283199,
	133584803,
	242017654,
	719166833,
	834697453,
	879263546,
	1019232566,
	1292550073,
	1297834604,
	1419259602,
	1510796294,
	2127497940,
	-1802111373,
	-1643311717,
	-1311188166,
	-1244697162,
	-1060376688,
	-948864541,
	-864071044,
	-751879320,
	-476999974,
	-378666035,
	-284530484,
	-233702408,
	30280292,
	41732045,
	54505570,
	120604643,
	331698185,
	474786474,
	492662035,
	584821987,
	673909600,
	696753474,
	787163418,
	1093030199,
	1117275649,
	1303507358,
	1596889034,
	1628921491,
	1673216541,
	1748373207,
	1803637785,
	1812712970,
	1908207721,
	1920766934,
	2088585697,
	-2134390671,
	-2122265662,
	-1991086481,
	-1939338394,
	-1862782800,
	-1858229297,
	-1819679999,
	-1815797865,
	-1645569664,
	-1623539657,
	-1604164737,
	-1448418975,
	-1431123016,
	-1423344014,
	-1293181572,
	-1211924901,
	-1040386459,
	-894288155,
	-860360254,
	-749007702,
	-519371139,
	-510950795,
	-510114122,
	-409479737,
	-216811017,
	-113711908,
	-46828581,
	-14824697,
	1499445407,
	1757890773,
	-1297130328,
	1423912753,
	-414301703,
	406701199,
	674386615,
	728379187,
	1818260702,
	-2053832767,
	-1973910443,
	-1082668955,
	-772093381,
	-86528958,
	507232138,
	-2051059045,
	-1591103463,
	-522767301,
	194929358,
	508578717,
	1092530042,
	1171226610,
	1851402669,
	1883767827,
	1975720265,
	-1226747327,
	-629211790,
	-466634713,
	-141795616,
	34626245,
	283731391,
	588746212,
	-834411899,
	-50297425,
	-31342544,
	-1809365172,
	-1408478050,
	-716370751,
	-612173099,
	-567121002,
	-2024941402,
	-1534577778,
	-1440675331,
	-1211176762,
	-1151968796,
	-848533860,
	830856441,
	1510350995,
	-789679769,
	190848106,
	895825612,
	993438435,
	-1775985984,
	-1023478668,
	-773956478,
	-361709910,
	-200270658,
	-127497991,
	184411343,
	771896020,
	967935536,
	1925740339,
	-1521897637,
	372806894,
	536714458,
	1988206529,
	-1974746920,
	-1956708897,
	-1122196204,
	-636161219,
	405490102,
	636239983,
	712823073,
	764325310,
	845427792,
	902305731,
	989607914,
	1191283411,
	1271362767,
	1451629584,
	1627459254,
	2054555425,
	-2103414139,
	-2074957003,
	-1961938422,
	-1935434583,
	-1934886317,
	-1615749463,
	-1323334072,
	-1309532876,
	-691276094,
	-447844606,
	-429506139,
	-24480300,
	1495728629,
	1646485471,
	2068117822,
	2075683947,
	-1995447743,
	-205102142,
	56660208,
	183712523,
	231100670,
	254481872,
	511673431,
	649433039,
	686788855,
	692757225,
	719619779,
	916581544,
	924267974,
	1070583795,
	1210814395,
	1234767744,
	1383396669,
	1417440092,
	1417838125,
	1505941229,
	1743953449,
	1924707253,
	1984181016,
	2081184892,
	2096114765,
	-2139512326,
	-2073602286,
	-1923847956,
	-1852748182,
	-1793687930,
	-1735839627,
	-1699673416,
	-1633151965,
	-1616778617,
	-1430793006,
	-1336911409,
	-1254057347,
	-1228362565,
	-1068985587,
	-1029570958,
	-933576527,
	-634281154,
	-610769108,
	-553835912,
	-322991750,
	-250563966,
	-209782407,
	-59515547,
	205032683,
	386105150,
	411599432,
	435889881,
	709895639,
	908140270,
	1008617843,
	1679934574,
	2029007468,
	2077558044,
	-2036638644,
	-1897865659,
	-1800377876,
	-1790706759,
	-1725697333,
	-1503851195,
	-1373409788,
	-1342300025,
	-961163794,
	-483215130,
	-269787403,
	505174455,
	1755785548,
	1834537343,
	-1645988897,
	-381473693,
	22956558,
	1481756818,
	1614850834,
	1980374609,
	2135160782,
	62512826,
	246150045,
	680545654,
	1514318372,
	-497360377,
	-262021866,
	1113860407,
	824748066,
	-1351899990,
	240772357,
	-1226896753,
	-389681572,
	18369533,
	127191252,
	226557169,
	476687617,
	478888800,
	568096966,
	1104817207,
	1856368424,
	1955414013,
	-1207218596,
	-605808708,
	-576687258,
	-331965904,
	-320403109,
	-116967529,
	-100150000,
	-1876837239,
	-770646513,
	-1391542137,
	-1221107646,
	-562632536,
	1743765516,
	1936501508,
	1946521576,
	-1406359343,
	-1013459033,
	-407068688,
	27526098,
	-1295818914,
	189901415,
	343391535,
	1028580175,
	1715626179,
	-1503000236,
	-1056172583,
	-575680736,
	324369003,
	640880475,
	752327294,
	948536844,
	2086295351,
	-1344285417,
	-415953049,
	-281275366,
	908775155,
	1152076881,
	1214168412,
	1310510260,
	1630537050,
	1751470296,
	1980575508,
	-2072507852,
	-1916084593,
	-1888820785,
	-1653579880,
	-1640722758,
	-1597293752,
	-1455316832,
	-1439328412,
	-1349658419,
	-1155483334,
	-835606817,
	-679185919,
	-382219232,
	-201465428,
	-129668545,
	14065784,
	50557240,
	82281660,
	94033046,
	206749196,
	266825280,
	308410851,
	371690004,
	401370450,
	409129751,
	465137550,
	516810429,
	554305630,
	573140494,
	861187315,
	901738482,
	970334657,
	1181416174,
	1183263476,
	1204906867,
	1226096098,
	1363336888,
	1418611013,
	1423626752,
	1568543846,
	1592112741,
	1636184722,
	1640603023,
	1687755487,
	1708614117,
	1863648219,
	1883360429,
	1956732224,
	2068484211,
	2113806544,
	2120179691,
	-2144326250,
	-2095306558,
	-2031294856,
	-1948374304,
	-1923863493,
	-1887958444,
	-1630731514,
	-1347357987,
	-1293161516,
	-1199165509,
	-1196624012,
	-1107759495,
	-1090537556,
	-1019371157,
	-1001336405,
	-957276853,
	-924548651,
	-783284068,
	-605257184,
	-583928751,
	-515279524,
	-250669847,
	-210665175,
	-117847307,
	-100099838,
	-91625813,
	90710077,
	95187046,
	154479184,
	373802338,
	483532006,
	513934897,
	620580306,
	738652812,
	869083804,
	886997475,
	974243296,
	1570947227,
	1803556695,
	-1962566219,
	-509143136,
	-428652579,
	-214604861,
	-136805090,
	925683259,
	1187864964,
	1199685211,
	-1546507097,
	-1082524312,
	-226455701,
	59120723,
	495423143,
	665690112,
	1143189384,
	1225215575,
	1296658155,
	1480174383,
	2111987179,
	-1975145165,
	-1666038504,
	-1583237641,
	-1407497494,
	-1161238459,
	-833697651,
	-73017470
}
end