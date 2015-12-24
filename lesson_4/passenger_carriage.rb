class PassengerCarriage
protected # Мы его будем вызывать при прицепке, чтобы вагоны не болтались отдельно на каких нибудь путях.
	def initialize
		@kind = "passenger"
	end
end
