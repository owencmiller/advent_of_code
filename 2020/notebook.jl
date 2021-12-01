### A Pluto.jl notebook ###
# v0.11.14

using Markdown
using InteractiveUtils

# ╔═╡ fcbb4cfc-34f0-11eb-3eaa-0590ced79527
md"# Day 1"

# ╔═╡ f476c1d2-34ed-11eb-1a04-7f25e45bb1d2
vals = [1587
1407
1717
1596
1566
1752
1925
1847
1716
1726
1611
1628
1853
1864
1831
1942
1634
1964
1603
1676
1256
1906
1655
1790
1666
1470
1540
1544
1100
1447
1384
1464
1651
1572
907
1653
1265
1510
1639
1818
376
1378
1132
1750
1491
1788
1882
1779
1640
1586
1525
1458
1994
1782
1412
1033
1416
1813
1520
1968
715
1396
1745
1506
1024
1798
1870
1615
1957
1718
1349
1983
1387
1738
1588
1321
1160
1907
1861
1940
1475
2004
1852
1760
1608
1028
1820
1495
1811
1737
1417
1316
1087
1803
1595
1346
1971
1692
1678
1330
1480
1097
1898
1973
1567
1733
1336
1381
1327
1670
1436
1989
1334
89
1862
1715
1743
1967
1765
1402
1729
1749
1671
1196
1650
1089
1814
1783
1225
1823
1746
2009
1886
1748
1481
1739
1912
1663
1668
1314
1594
705
1449
1731
1487
1648
1466
1317
1979
1799
1926
1703
1656
1978
2005
1865
1982
1951
1892
1713
1744
1598
1606
1583
1895
1804
1430
1816
1364
1575
1918
1431
1812
1471
1797
928
1934
1156
94
1563
1909
1453
1392
1427
1819
1524
1695
1866
2008
1413
1698
1051
1707
1904
1681
1541
1621
1421
1809
1576]

# ╔═╡ 31489c16-34ee-11eb-2e04-97046c3d4403
function day1(vals)
	ans = 0
	vi = 0
	vj = 0
	for i in 1:length(vals)
		for j in (i+1):length(vals)
			for k in 1:length(vals)
				if vals[i]+vals[j]+vals[k] == 2020
					ans = vals[i]*vals[j]*vals[k]
					vi = vals[i]
					vj = vals[j]
					vk = vals[k]
				end
			end
		end
	end
	return vi, vj, ans
end

# ╔═╡ 9e910ba0-34ee-11eb-3184-797831799598
day1(vals)

# ╔═╡ f7e6ae42-34f0-11eb-2b6a-87a53f88b921
md"# Day 2"

# ╔═╡ 7fcb5880-34f6-11eb-3708-d5c601eea165
f = "testing string"

# ╔═╡ 07cc608e-34f1-11eb-08fd-87fff37d408f
function day2()
	file = open("./input2.txt", "r")
	total = 0
	while ! eof(file)
		line = readline(file)
		parts = split(line, " ")
		mini = parse(Int, split(parts[1], "-")[1])
		maxi = parse(Int, split(parts[1], "-")[2])
		letter = parts[2][1]
		s = parts[3]
		c = count(v -> v == letter, s)
		@show mini maxi c letter
		if mini <= c <= maxi
			total += 1
		end
	end
	return total
end

# ╔═╡ 08b874ca-3509-11eb-1bd0-3d15fc4acbba
function day2_p2()
	file = open("./input2.txt", "r")
	total = 0
	while ! eof(file)
		line = readline(file)
		parts = split(line, " ")
		mini = parse(Int, split(parts[1], "-")[1])
		maxi = parse(Int, split(parts[1], "-")[2])
		letter = parts[2][1]
		s = parts[3]
		if (s[mini] == letter && s[maxi] != letter) || (s[mini] != letter && s[maxi] == letter)
			total += 1
		end
	end
	return total
end

# ╔═╡ 5718f0d2-34f1-11eb-3caa-7bd729baaeb0
day2_p2()

# ╔═╡ 96b34544-36ae-11eb-1a52-a1ff388512a2
md"# Day 3"

# ╔═╡ a1c5e248-36ae-11eb-0834-136081d28b56
function day3()
	file = open("./input3.txt", "r")
	right = 1
	down = 1
	counter = 0
	while ! eof(file)
		line = readline(file)
		right = (right % length(line)) + 1
		
		point = line[right]
		if point == '#'
			counter += 1
		end
		@show typeof(line)
		right += 3
		down += 1
	end
	return counter
end

# ╔═╡ 80f51dda-36af-11eb-254e-b1ca3466272c
day3()

# ╔═╡ Cell order:
# ╟─fcbb4cfc-34f0-11eb-3eaa-0590ced79527
# ╟─f476c1d2-34ed-11eb-1a04-7f25e45bb1d2
# ╠═31489c16-34ee-11eb-2e04-97046c3d4403
# ╠═9e910ba0-34ee-11eb-3184-797831799598
# ╟─f7e6ae42-34f0-11eb-2b6a-87a53f88b921
# ╠═7fcb5880-34f6-11eb-3708-d5c601eea165
# ╠═07cc608e-34f1-11eb-08fd-87fff37d408f
# ╠═08b874ca-3509-11eb-1bd0-3d15fc4acbba
# ╠═5718f0d2-34f1-11eb-3caa-7bd729baaeb0
# ╟─96b34544-36ae-11eb-1a52-a1ff388512a2
# ╠═a1c5e248-36ae-11eb-0834-136081d28b56
# ╠═80f51dda-36af-11eb-254e-b1ca3466272c
