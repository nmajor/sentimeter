webhosting = Category.create(name: 'webhosting')

Organization.create(
  category: webhosting,
  name: 'Bluehost',
  keywords: [ 'bluehost', '@bluehost', 'bluehost.com' ],
  desc: 'Webhosting company',
  homepage_url: 'https://bluehost.com',
)
