# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Levels creation

level_id = 0
9.times do |x|
  level_id +=1
  test = Level.create(level_id: level_id)
  test.images.attach(io: File.open("storage/Level_Assets/MMX_#{level_id}.webp"), filename: "MMX_#{level_id}.webp")
end
puts("Levels Successfully Created!")


# Level Coordinates

coordinates =
[ {
  level_id: 1,
  coordinate_set: [ {
    character_id: 1,
    coordinates: [[10,2], [11,2], [12,2], [12,3], [11,3], [10,3], [10,4], [11,4], [12,4]]
  },
  {
    character_id: 2,
    coordinates: [[10,15], [11,15], [12,15], [12,16], [11,16], [10,16], [10,17], [11,17], [12,17]]
  },
  {
    character_id: 3,
    coordinates: [[3,10], [4,10], [5,10], [5,11], [4,11], [3,11], [3,12], [4,12], [5,12], [5,13], [4,13], [3,13]]
  },
  {
    character_id: 4,
    coordinates: [[14,6], [15,6], [16,6], [16,7], [15,7], [14,7], [14,8], [15,8], [16,8], [16,9], [15,9], [14,9]]
  }
  ]
},
{
  level_id: 2,
  coordinate_set: [ {
    character_id: 1,
    coordinates: [[12,15], [13,15], [14,15], [14,16], [13,16], [12,16], [12,17], [13,17], [14,17]]
  },
  {
    character_id: 2,
    coordinates: [[1,2], [2,2], [3,2], [3,3], [2,3], [1,3], [1,4], [2,4], [3,4]]
  },
  {
    character_id: 3,
    coordinates: [[1,15], [2,15], [3,15], [3,16], [2,16], [1,16], [1,17], [2,17], [3,17]]
  },
  {
    character_id: 4,
    coordinates: [[16,2], [17,2], [18,2], [18,3], [17,3], [16,3], [16,4], [17,4], [18,4]]
  }
  ]
},
{
  level_id: 3,
  coordinate_set: [ {
    character_id: 1,
    coordinates: [[0,15], [1,15], [2,15], [3,15], [3,16], [2,16], [1,16], [0,16], [0,17], [1,17], [2,17], [3,17], [3,18], [2,18], [1,18], [0,18]]
  },
  {
    character_id: 2,
    coordinates: [[16,15], [17,15], [18,15], [18,16], [17,16], [16,16], [16,17], [16,18], [17,17], [17,18], [18,18], [18,17]]
  },
  {
    character_id: 3,
    coordinates: [[4,2], [5,2], [6,2], [7,2], [7,3], [6,3], [5,3], [5,4], [6,4], [7,4], [5,1], [6,1], [7,1]]
  },
  {
    character_id: 4,
    coordinates: [[16,1], [16,2], [16,3], [16,4], [17,4], [17,3], [17,2], [17,1], [18,1], [18,2], [18,3], [18,4]]
  }
  ]
},
{
  level_id: 4,
  coordinate_set: [ {
    character_id: 1,
    coordinates: [[15,14], [16,14], [17,14], [15,15], [16,15], [17,15], [15,16], [16,16], [17,16], [18,16], [15,17], [16,17], [17,17], [18,17], [15,18], [16,18], [17,18], [18,18]]
  },
  {
    character_id: 2,
    coordinates: [[5,1], [5,2], [5,3], [6,1], [6,2], [6,3], [6,4], [6,5], [6,6], [7,6], [7,5], [7,4], [7,3], [7,2], [7,1], [8,1], [8,2], [8,3], [8,4], [8,5], [8,6]]
  },
  {
    character_id: 3,
    coordinates: [[2,13], [2,14], [2,15], [2,16], [2,17], [1,17], [1,18], [2,18], [3,18], [3,17], [3,16], [3,15], [3,14], [4,14], [4,15], [4,16], [4,16], [4,18]]
  },
  {
    character_id: 4,
    coordinates: [[15,1], [15,2], [15,3], [15,4], [15,5], [15,5], [16,6], [16,5], [16,4], [16,3], [16,2], [16,1], [17,1], [17,2], [17,3], [17,4], [18,4], [18,3], [14,6], [14,5], [14,4]]
  }
  ]
},
{
  level_id: 5,
  coordinate_set: [ {
    character_id: 1,
    coordinates: [[15,15], [16,15], [17,15], [18,15], [15,16], [16,16], [17,16], [18,16], [15,17], [16,17], [17,17], [18,17]]
  },
  {
    character_id: 2,
    coordinates: [[1,15], [2,15], [3,15], [4,15], [4,16], [3,16], [2,16], [1,16], [1,17], [2,17], [3,17], [4,17]]
  },
  {
    character_id: 3,
    coordinates: [[15,10], [16,10], [17,10], [18,10], [18,11], [17,11], [16,11], [15,11], [15,12], [16,12], [17,12], [18,12], [18,13], [17,13], [16,13], [15,13]]
  },
  {
    character_id: 4,
    coordinates: [[1,10], [2,10], [3,10], [4,10], [4,11], [3,11], [2,11], [1,11], [1,12], [2,12], [3,12], [4,12], [4,13], [3,13], [2,13], [1,13]]
  }
  ]
},
{
  level_id: 6,
  coordinate_set: [ {
    character_id: 1,
    coordinates: [[3,4], [4,4], [2,5], [3,5], [4,5], [2,6], [3,6], [4,6], [3,7], [4,7]]
  },
  {
    character_id: 2,
    coordinates: [[12,14], [13,14], [11,15], [12,15], [13,15], [11,16], [12,16], [13,16], [12,17], [13,17]]
  },
  {
    character_id: 3,
    coordinates: [[6,14], [7,14], [5,15], [6,15], [7,15], [5,16], [6,16], [7,16], [6,17], [7,17]]
  },
  {
    character_id: 4,
    coordinates: [[15,4], [16,4], [14,5], [15,5], [16,5], [14,6], [15,6], [16,6], [15,7], [16,7]]
  }
  ]
},
{
  level_id: 7,
  coordinate_set: [ {
    character_id: 1,
    coordinates: [[3,8], [4,8], [3,9], [4,9], [5,9], [5,10], [4,10], [3,10], [3,11], [4,11]]
  },
  {
    character_id: 2,
    coordinates: [[8,16], [9,16], [10,16], [8,17], [9,17], [10,17], [9,18], [10,18]]
  },
  {
    character_id: 3,
    coordinates: [[9,1], [10,1], [8,2], [9,2], [10,2], [11,2], [8,3], [9,3], [10,3]]
  },
  {
    character_id: 4,
    coordinates: [[4,14], [5,14], [6,14], [4,15], [5,15], [6,15], [4,16], [5,16], [6,16]]
  }
  ]
},
{
  level_id: 8,
  coordinate_set: [ {
    character_id: 1,
    coordinates: [[5,14], [6,14], [7,14], [7,13], [6,13], [5,13]]
  },
  {
    character_id: 2,
    coordinates: [[6,11], [7,11], [7,12], [6,12]]
  },
  {
    character_id: 3,
    coordinates: [[12,13], [13,13], [13,14], [12,14]]
  },
  {
    character_id: 4,
    coordinates: [[9,11], [9,10], [10,10], [10,11]]
  }
  ]
},
{
  level_id: 9,
  coordinate_set: [ {
    character_id: 1,
    coordinates: [[1,4], [0,4]]
  },
  {
    character_id: 2,
    coordinates: [[11,2], [11,3], [12,2]]
  },
  {
    character_id: 3,
    coordinates: [[12,8], [13,8]]
  },
  {
    character_id: 4,
    coordinates: [[12,5]]
  }
  ]
}
]

coordinates.each do |coordBlock| # first array, level_id
  # puts("coordBlock")
  # puts(coordBlock[:level_id])
  # puts("coordBlock")
  coordBlock[:coordinate_set].each do |coords| # coordinate_set object
    # puts("coords")
    # puts(coords[:coordinates])
    # puts("coords")
    coords[:coordinates].each do |x, y| # each coordinate
      # puts("x")
      # puts(x)
      # puts("x")
      # puts("y")
      # puts(y)
      # puts("y")
      Coordinate.create(level_id: coordBlock[:level_id], x_cord: x, y_cord: y, character_id: coords[:character_id])
      puts("Coordinates Successfully Created!")
      end
    end
  end


  