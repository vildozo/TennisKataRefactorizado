
class TennisGame1

  def initialize(player1Name, player2Name)
    @player1Name = player1Name
    @player2Name = player2Name
    @p1points = 0
    @p2points = 0
  end
        
  def won_point(playerName)
    if playerName == @player1Name
      @p1points += 1
    else
      @p2points += 1
    end
  end
  
  def score
    result = ""
    tempScore=0
    if (@p1points==@p2points)
      result = {
          0 => "Love-All",
          1 => "Fifteen-All",
          2 => "Thirty-All",
      }.fetch(@p1points, "Deuce")
    elsif (@p1points>=4 or @p2points>=4)
      minusResult = @p1points-@p2points
      if (minusResult==1)
        result ="Advantage " + @player1Name
      elsif (minusResult ==-1)
        result ="Advantage " + @player2Name
      elsif (minusResult>=2)
        result = "Win for " + @player1Name
      else
        result ="Win for " + @player2Name
      end
    else
      (1...3).each do |i|
        if (i==1)
          tempScore = @p1points
        else
          result+="-"
          tempScore = @p2points
        end
        result += {
            0 => "Love",
            1 => "Fifteen",
            2 => "Thirty",
            3 => "Forty",
        }[tempScore]
      end
    end
    result
  end
end
#____________________________________________________________________________________________________________
class TennisGame2
  def initialize(player1Name, player2Name)
    @player1Name = player1Name
    @player2Name = player2Name
    @p1points = 0
    @p2points = 0
  end
      
  def won_point(playerName)
    if playerName == @player1Name
      p1Score()
    else
      p2Score()
    end
  end

  def DevuelveValorDeAnotacion(punto)
    if (punto==0)
        return ("Love")
    elsif (punto==1)
        return ("Fifteen")
    elsif (punto==2)
        return ("Thirty")
    elsif (punto==3)
        return ("Forty")
    end
  end

  def es_ganador(puntos_jugador1,puntos_jugador2)
    if(puntos_jugador1>=4 and puntos_jugador2>=0 and (puntos_jugador1-puntos_jugador2)>=2)
      return true
    else
      return false
    end
  end

  def score
      result = ""
      if (@p1points == @p2points and @p1points < 3)
          result=DevuelveValorDeAnotacion(@p1points)+"-All"
      end
      if (@p1points==@p2points and @p1points>2)
          result = "Deuce"
      end
      


      p1res = ""
      p2res = ""
      #UNO DE LOS JUGADORES ESTA EN 0 Y EL OTRO ESTA GANANDO EN PUNTOS
      if (@p1points < 4 and @p2points < 4 and (@p1points!=@p2points) and (@p2points==0||@p1points==0))
          if (@p2points==0)
                  result = DevuelveValorDeAnotacion(@p1points) + "-Love"
          end
          if (@p1points==0)
                result = "Love-" + DevuelveValorDeAnotacion(@p2points)
          end
      else
          #DETERMINAMOS LOS PUNTOS EN EL JUEGO SI SON INFERIORES A "FORTY" PARA AMBOS JUGADORES
          if ((@p1points>@p2points and @p1points < 4)||(@p2points>@p1points and @p2points < 4))
              
              result = DevuelveValorDeAnotacion(@p1points) + "-" + DevuelveValorDeAnotacion(@p2points)
          else
            #DETERMINAMOS SI LA PUNTACION ESTA EN ADVANTAGE
              if(@p1points!=@p2points and (@p2points>=3 || @p1points >= 3))
                  if @p1points>@p2points
                      result = "Advantage " + @player1Name
                  else
                      result = "Advantage " + @player2Name
                  end
              end          
          end
      end
   #DETERMINAMOS SI HAY UN GANADOR
    if(es_ganador(@p1points,@p2points))
      result = "Win for " + @player1Name
    end
    if(es_ganador(@p2points,@p1points))
      result = "Win for " + @player2Name
    end
    result
  end

  def setp1Score(number)
    (0..number).each do |i|
        p1Score()
    end
  end

  def setp2Score(number)
    (0..number).each do |i|
      p2Score()
    end
  end

  def p1Score
    @p1points +=1
  end
  
  def p2Score
    @p2points +=1
  end
end
#____________________________________________________________________________________________________________
class TennisGame3
  def initialize(player1Name, player2Name)
    @p1N = player1Name
    @p2N = player2Name
    @p1 = 0
    @p2 = 0
  end
      
  def won_point(n)
    if n == @p1N
        @p1 += 1
    else
        @p2 += 1
    end
  end
  
  def score
    if (@p1 < 4 and @p2 < 4) and (@p1 + @p2 < 6)
      p = ["Love", "Fifteen", "Thirty", "Forty"]
      s = p[@p1]
      @p1 == @p2 ? s + "-All" : s + "-" + p[@p2]
    else
      if (@p1 == @p2)
        "Deuce"
      else
        s = @p1 > @p2 ? @p1N : @p2N
        (@p1-@p2)*(@p1-@p2) == 1 ? "Advantage " + s : "Win for " + s
      end
    end
  end
end
