def seed_boards
  b = [
    {
      handle: '/v/',
      name: 'Video Games',
      category: 'Video Games',
      description: 'Imageboard dedicated to the discussion of PC and console video games.'
    },
    {
      handle: '/g/',
      name: 'Technology',
      category: 'Interests',
      description: 'Imageboard for discussing computer hardware and software, programming, and general technology.'
    },
    {
      handle: '/tv/',
      name: 'Television & Film',
      category: 'Interests',
      description: 'Imageboard dedicated to the discussion of television and film.'
    },
    {
      handle: '/sp/',
      name: 'Sports',
      category: 'Interests',
      description: 'Imageboard for sports discussion.'
    },
    {
      handle: '/sci/',
      name: 'Science & Math',
      category: 'Interests',
      description: 'Board for the discussion of science and math.'
    },
    {
      handle: '/p/',
      name: 'Photography',
      category: 'Creative',
      description: 'Imageboard for sharing and critiquing photos.'
    },
    {
      handle: '/ck/',
      name: 'Food & Cooking',
      category: 'Creative',
      description: 'Imageboard for food pictures and cooking recipes.'
    },
    {
      handle: '/lit/',
      name: 'Literature',
      category: 'Creative',
      description: 'Board for the discussion of books, authors, and literature.'
    },
    {
      handle: '/mu/',
      name: 'Music',
      category: 'Creative',
      description: 'Imageboard for discussing all types of music.'
    },
    {
      handle: '/gd/',
      name: 'Graphic Design',
      category: 'Creative',
      description: 'Imageboard for graphic design.'
    },
    {
      handle: '/b/',
      name: 'Random',
      category: 'Misc',
      description: 'The birthplace of Anonymous and the edgiest of memes.'
    }
  ]
  return b
end
