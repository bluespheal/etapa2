# Este archivo sirve para correr código que te permita 
# rellenar tu base de datos con información. 

module TaskSeeds
  def self.import(filename=File.dirname(__FILE__) + "/../words.csv")
    Word.transaction do
      File.open(filename).each do |line|
        Word.create( word: line, canon: line.chars.sort.join)
      end
    end
  end
end


TaskSeeds.import