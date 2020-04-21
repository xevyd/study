module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        res = _array.filter_map { |film| film if film["country"].present? }.
                     filter_map { |film| film if film["rating_kinopoisk"].present? }.
                     filter_map { |film| film if film["rating_kinopoisk"].to_f > 0}.
                     filter_map { |film| film["rating_kinopoisk"].to_f if film["country"].split(',').length >= 2 }
        rating = res.reduce(0, :+) { |rate| rate.to_f }
        rating / res.length
      end

      def chars_count(_films, _threshold)
        res = _films.filter_map { |film| film unless film["rating_kinopoisk"].nil? }.
              filter_map { |film| film["name"] if film["rating_kinopoisk"].to_f >= _threshold }.
              map { |name| name.count('и') }
        res.reduce(0, :+) { |name| name }
      end
    end
  end
end