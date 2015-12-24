class CargoCarriage
protected # Мы его будем вызывать при прицепке, чтобы вагоны не болтались отдельно на каких нибудь путях.
	def initialize
		@kind = "cargo"
	end
end