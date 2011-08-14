#---
# Excerpted from "Agile Web Development with Rails, 4rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
# encoding: utf-8

# Brands
Brand.delete_all
Brand.create(:name => '苹果',
  :description =>
  %{<p>
                        知名电子消费品厂商.
        </p>},
  :image_url =>   '/images/Brands/apple.jpg')

Brand.create(:name => 'Pragmatic Programmer',
  :description =>
  %{<p>
        Excerpted from "Agile Web Development with Rails, 4rd Ed."                
        </p>},
  :image_url =>   '/images/Brands/rails.png')

# Products
Product.delete_all
Product.create(:title => 'Web Design for Developers',
  :brand_id => 2,
  :description =>
  %{<p>
          <em>Web Design for Developers</em> will show you how to make your
          web-based application look professionally designed. We'll help you
          learn how to pick the right colors and fonts, avoid costly interface
          and accessibility mistakes -- your application will really come alive.
          We'll also walk you through some common Photoshop and CSS techniques
          and work through a web site redesign, taking a new design from concept
          all the way to implementation.
        </p>},
  :image_url =>   '/images/Products/wd4d.jpg',
  :price => 42.95)
# . . .
Product.create(:title => 'Programming Ruby 1.9',
  :brand_id => 2,
  :description =>
  %{<p>
          Ruby is the fastest growing and most exciting dynamic language
          out there. If you need to get working programs delivered fast,
          you should add Ruby to your toolbox.
        </p>},
  :image_url => '/images/Products/ruby.jpg',
  :price => 49.50)
# . . .

Product.create(:title => 'Rails Test Prescriptions',
  :brand_id => 2,
  :description =>
  %{<p>
          <em>Rails Test Prescriptions</em> is a comprehensive guide to testing
          Rails applications, covering Test-Driven Development from both a
          theoretical perspective (why to test) and from a practical perspective
          (how to test effectively). It covers the core Rails testing tools and
          procedures for Rails 2 and Rails 3, and introduces popular add-ons,
          including Cucumber, Shoulda, Machinist, Mocha, and Rcov.
        </p>},
  :image_url => '/images/Products/rtp.jpg',
  :price => 43.75)

Product.create(:title => '苹果（APPLE）iPhone 4 16G版 3G手机（白色）WCDMA/GSM',
  :brand_id => 1,
  :model => 'iPhone4',
  :rank => 10,
  :price => 5880.00,
  :spec =>
  %{WCDMA/GSM},
  :description =>
  %{One of the most popular mobile phone.},
  :image_url =>   '/images/Products/iPhone4.jpg')
