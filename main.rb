class AutomatoMorse
  def initialize(cadeia)
    @cadeia = cadeia
    @indice = 0
    @max = cadeia.size
  end

  def proximo
    if @indice < @max
      char = @cadeia[@indice]
      @indice += 1
      char
    else
      ""
    end
  end
  def iniciar
    estado = "q0"
    caractere = ""
    resultado = ""

    puts "Máquina iniciou no estado: #{estado}"

    loop do
      entrada = proximo

      case [entrada, estado]
      in [".", "q0"]
        estado = "q1"
        caractere += "."
      in ["-", "q0"]
        estado = "q1"
        caractere += "-"
      in [".", "q1"] | ["-", "q1"]
        estado = "q1"
        caractere += entrada
      in [" ", "q1"]
        resultado += traduzir(caractere)
        caractere = ""
        estado = "q0"
      in ["/", "q1"]
        resultado += traduzir(caractere) + " "
        caractere = ""
        estado = "q0"
      in ["", "q1"]
        resultado += traduzir(caractere)
        puts "Saída: #{resultado}"
        return
      in [" ", "q0"]
        estado = "q0"
      in ["/", "q0"]
        resultado += " "
        estado = "q0"
      in ["", "q0"]
        puts "Saída: #{resultado}"
        return
      else
        puts "Erro no processamento."
        return
      end
    end
  end

  def traduzir(morse)
    case morse
    in ".-" then "A"
    in "-..." then "B"
    in "-.-." then "C"
    in "-.." then "D"
    in "." then "E"
    in "..-." then "F"
    in "--." then "G"
    in "...." then "H"
    in ".." then "I"
    in ".---" then "J"
    in "-.-" then "K"
    in ".-.." then "L"
    in "--" then "M"
    in "-." then "N"
    in "---" then "O"
    in ".--." then "P"
    in "--.-" then "Q"
    in ".-." then "R"
    in "..." then "S"
    in "-" then "T"
    in "..-" then "U"
    in "...-" then "V"
    in ".--" then "W"
    in "-..-" then "X"
    in "-.--" then "Y"
    in "--.." then "Z"
    in "-----" then "0"
    in ".----" then "1"
    in "..---" then "2"
    in "...--" then "3"
    in "....-" then "4"
    in "....." then "5"
    in "-...." then "6"
    in "--..." then "7"
    in "---.." then "8"
    in "----." then "9"
    in ".-.-.-" then "."
    in "--..--" then ","
    in "-....-" then "-"
    in "..--.." then "?"
    else "?"
    end
  end
end

# digite o codigo morse
automato = AutomatoMorse.new("-.-. --- -.. .. --. --- / -- --- .-. ... .")
automato.iniciar 
