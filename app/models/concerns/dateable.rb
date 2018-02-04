module Dateable
  extend ActiveSupport::Concern

  def created_at_format
    meses = ["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"]
    mes = meses[created_at.strftime("%-m").to_i - 1]
    dia = created_at.strftime("%d")
    year = created_at.strftime("%Y")
    
    "#{dia} de #{mes} del #{year}"
  end

end