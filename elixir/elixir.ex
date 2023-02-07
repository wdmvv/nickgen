defmodule Nickgen do
  def get_letter do
    if Enum.random(0..1) == 1 do 
      Enum.random(['a', 'e', 'i', 'o', 'u', 'y'])
    else
      Enum.random(['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'z'])
    end
  end

  def get_nick do
    Enum.map(0..Enum.random(3..9), fn _ -> Nickgen.get_letter end)
    |> Nickgen.add_numbers
  end

  def add_numbers(nick) do
    if Enum.random(0..1) == 1 do
      "#{nick}#{Enum.random(0..999)}"
    else
      nick
    end
  end

  def generate_nicks(n) do 
    Enum.map(1..n, fn _ -> Nickgen.get_nick end)
    |> Enum.join(", ")
  end
end

IO.puts Nickgen.generate_nicks(10)
