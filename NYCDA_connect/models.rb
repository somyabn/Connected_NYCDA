class User < ActiveRecord::Base
has_many :posts
has_many :relationships, foreign_key: :follower_id, dependent: :destroy#if user is destroyed all dependents destroyed
has_many :followers, through: :relationships
has_many :followed, through: :relatipnships
end
class Post <ActiveRecord::Base
belongs_to :users
belongs_to :posts
end
class Course <ActiveRecord::Base
has_many :users
end
class Relationship <ActiveRecord::Base
belongs_to :follower,class_name:"User"#map it to User class

belongs_to :followed,class_name:"User"
  validates_uniqueness_of :follower_id, scope: :followed_id#All of the relationship should be unique
end
