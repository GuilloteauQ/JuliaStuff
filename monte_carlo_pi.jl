### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ e15a39aa-9314-11eb-0107-afe82a4f1874
md"# Computation of $\pi$ using Monte Carlo"

# ╔═╡ 2a612e92-9315-11eb-3448-b5d7390579c7
md"## Getting a random float"

# ╔═╡ 072a8f86-9315-11eb-1ff3-b1b1224589d9
import Random

# ╔═╡ 0dd8bc40-9315-11eb-15e2-87cc605d9ad6
x = rand()

# ╔═╡ f5f75060-9315-11eb-2b5c-958d57c194ca
md"## Setting up the seed"

# ╔═╡ feb78a1a-9315-11eb-3cab-a94746d4b189
Random.seed!(38100)

# ╔═╡ 17792da2-9315-11eb-340d-bb149ecfe858
md"## Defining a function"

# ╔═╡ 1319c794-9315-11eb-09e5-cf395b8bf1a1
function get_new_point()
	x = rand()
	y = rand()
	(x, y)
end

# ╔═╡ e3b42fbc-9314-11eb-18ae-59afdcf33711
p = get_new_point()

# ╔═╡ df461f26-9314-11eb-0742-317bb98fb32f
md"## Testing if the point is in the quater circle"

# ╔═╡ 74478222-9315-11eb-0ab0-65f2dfbe1028
function is_in_quater(x, y)
	x * x + y * y <= 1
end

# ╔═╡ 8f0e115c-9315-11eb-1036-fd28845cb931
(p_x, p_y) = get_new_point()

# ╔═╡ 99f82c92-9315-11eb-0b60-650b772a7f08
is_in_quater(p_x, p_y)

# ╔═╡ e07ae996-9315-11eb-1dd9-2fb3659cfd79
md"## Monte Carlo Experiment"

# ╔═╡ 3146a1fa-9316-11eb-311e-bbde16571f77
function monte_carlo(iterations)
	s = 0
	for i in 0:iterations
		(x, y) = get_new_point()
		if is_in_quater(x, y)
			s = s + 1
		end
	end
	s
end

# ╔═╡ 72200c28-9316-11eb-1454-9bbc3f235353
iterations = 100000

# ╔═╡ 7942009c-9316-11eb-03f5-2d1ec8bee32a
points_in_quater_circle = monte_carlo(iterations)

# ╔═╡ 93fff8a0-9316-11eb-1d03-27554aca3458
md"Let's check our approximation of $\pi$"

# ╔═╡ a5515702-9316-11eb-2ad4-f15966a3e2a9
md"The formula is:
$$\frac{\pi}{4} = \frac{\text{points in circle}}{\text{total nb of points}}$$"

# ╔═╡ e1f06e32-9316-11eb-041c-1fb3c05b4e9e
pi = 4 * points_in_quater_circle / iterations

# ╔═╡ 2ad1fe9a-9317-11eb-2f56-11c4ee53ed73
md"Our final estimation of $\pi$ with $(iterations) iterations is: $(pi)"

# ╔═╡ Cell order:
# ╠═e15a39aa-9314-11eb-0107-afe82a4f1874
# ╠═2a612e92-9315-11eb-3448-b5d7390579c7
# ╠═072a8f86-9315-11eb-1ff3-b1b1224589d9
# ╠═0dd8bc40-9315-11eb-15e2-87cc605d9ad6
# ╠═f5f75060-9315-11eb-2b5c-958d57c194ca
# ╠═feb78a1a-9315-11eb-3cab-a94746d4b189
# ╠═17792da2-9315-11eb-340d-bb149ecfe858
# ╠═1319c794-9315-11eb-09e5-cf395b8bf1a1
# ╠═e3b42fbc-9314-11eb-18ae-59afdcf33711
# ╠═df461f26-9314-11eb-0742-317bb98fb32f
# ╠═74478222-9315-11eb-0ab0-65f2dfbe1028
# ╠═8f0e115c-9315-11eb-1036-fd28845cb931
# ╠═99f82c92-9315-11eb-0b60-650b772a7f08
# ╠═e07ae996-9315-11eb-1dd9-2fb3659cfd79
# ╠═3146a1fa-9316-11eb-311e-bbde16571f77
# ╠═72200c28-9316-11eb-1454-9bbc3f235353
# ╠═7942009c-9316-11eb-03f5-2d1ec8bee32a
# ╠═93fff8a0-9316-11eb-1d03-27554aca3458
# ╠═a5515702-9316-11eb-2ad4-f15966a3e2a9
# ╠═e1f06e32-9316-11eb-041c-1fb3c05b4e9e
# ╠═2ad1fe9a-9317-11eb-2f56-11c4ee53ed73
