class Application

    def call(env)
      res = Rack::Response.new
      req = Rack::Request.new(env)
  
      #Item Update
      if req.path.match('/items/') && req.patch?
        item_id = req.path.split('/')[2]
        body = JSON.parse(req.body.read)
        begin
          item_details = Item.find(item_id)
          item_details.update(body)
          return [
            202,
            {'Content-Type' => 'application/json'},
            [item_details.to_json]
          ]
        rescue
          return [
            404,
            {'Content-Type' => 'application/json'},
            [{message: "unable to update item."}.to_json]
          ]
        end
      end

      #Room Update
      if req.path.match('/rooms/') && req.patch?
        room_id = req.path.split('/')[2]
        body = JSON.parse(req.body.read)
        begin
          room_details = Room.find(room_id)
          room_details.update(body)
          return [
            202,
            {'Content-Type' => 'application/json'},
            [room_details.to_json]
          ]
        rescue
          return [
            404,
            {'Content-Type' => 'application/json'},
            [{message: "unable to update room."}.to_json]
          ]
        end
      end

      #Category Update
      if req.path.match('/categories/') && req.patch?
        category_id = req.path.split('/')[2]
        body = JSON.parse(req.body.read)
        begin
          category_details = Category.find(category_id)
          category_details.update(body)
          return [
            202,
            {'Content-Type' => 'application/json'},
            [category_details.to_json]
          ]
        rescue
          return [
            404,
            {'Content-Type' => 'application/json'},
            [{message: "unable to update category."}.to_json]
          ]
        end
      end
  
      #Item Delete
      if req.path.match('/items/') && req.delete?
        item_id = req.path.split('/')[2]
        begin
          item_details = Item.find(item_id)
          item_details.destroy
          return [
            200,
            {'Content-Type' => 'application/json'},
            [{message: "item deleted."}.to_json]
          ]
        rescue
          return [
            404,
            {'Content-Type' => 'application/json'},
            [{message: "unable to delete item."}.to_json]
          ]
        end
      end

      #Room Delete
      if req.path.match('/rooms/') && req.delete?
        room_id = req.path.split('/')[2]
        begin
          room_details = Room.find(room_id)
          room_details.destroy
          return [
            200,
            {'Content-Type' => 'application/json'},
            [{message: "room deleted."}.to_json]
          ]
        rescue
          return [
            404,
            {'Content-Type' => 'application/json'},
            [{message: "unable to delete room."}.to_json]
          ]
        end
      end

      #Category Delete
      if req.path.match('/categories/') && req.delete?
        category_id = req.path.split('/')[2]
        begin
          category_details = Category.find(category_id)
          category_details.destroy
          return [
            200,
            {'Content-Type' => 'application/json'},
            [{message: "category deleted."}.to_json]
          ]
        rescue
          return [
            404,
            {'Content-Type' => 'application/json'},
            [{message: "unable to delete category."}.to_json]
          ]
        end
      end
  
      #show all items
      if req.path == '/items' && req.get?
        all_items = Item.all
        return [
          200,
          {'Content-Type' => 'application/json'},
          [all_items.to_json]
        ]
      else
        res.write "Path not found"
      end

      #show all rooms
      if req.path == '/rooms' && req.get?
        all_rooms = Room.all
        return [
          200,
          {'Content-Type' => 'application/json'},
          [all_rooms.to_json]
        ]
      else
        res.write "Path not found"
      end

      #show all categories
      if req.path == '/categories' && req.get?
        all_categories = Category.all
        return [
          200,
          {'Content-Type' => 'application/json'},
          [all_categories.to_json]
        ]
      else
        res.write "Path not found"
      end
  
      #show single item by index
      if req.path.match('/items/') && req.get?
        item_id = req.path.split('/')[2]
        begin
          item_details = Item.find(item_id)
          return [
            200,
            {'Content-Type' => 'application/json'},
            [item_details.to_json]
          ]
        rescue
          return [
            404,
            {'Content-Type' => 'application/json'},
            [{message: "item id not found"}.to_json]
          ]
        end
        else
        res.write "item not found."
      end

      #show single room by index
      if req.path.match('/rooms/') && req.get?
        room_id = req.path.split('/')[2]
        begin
          room_details = Room.find(room_id)
          return [
            200,
            {'Content-Type' => 'application/json'},
            [room_details.to_json]
          ]
        rescue
          return [
            404,
            {'Content-Type' => 'application/json'},
            [{message: "room id not found"}.to_json]
          ]
        end
        else
        res.write "room not found."
      end

      #show single category by index
      if req.path.match('/categories/') && req.get?
        category_id = req.path.split('/')[2]
        begin
          category_details = Category.find(category_id)
          return [
            200,
            {'Content-Type' => 'application/json'},
            [category_details.to_json]
          ]
        rescue
          return [
            404,
            {'Content-Type' => 'application/json'},
            [{message: "category id not found"}.to_json]
          ]
        end
        else
        res.write "category not found."
      end
  
      #add item to database
      if req.path.match(/items/) && req.post?
        body = JSON.parse(req.body.read)
        add_item = Item.create(body)
        return [
          201,
          {'Content-Type' => 'application/json'},
          [add_item.to_json]
        ]
      end

      #add room to database
      if req.path.match(/rooms/) && req.post?
        body = JSON.parse(req.body.read)
        add_room = Room.create(body)
        return [
          201,
          {'Content-Type' => 'application/json'},
          [add_room.to_json]
        ]
      end

      #add item to database
      if req.path.match(/categories/) && req.post?
        body = JSON.parse(req.body.read)
        add_category = Category.create(body)
        return [
          201,
          {'Content-Type' => 'application/json'},
          [add_category.to_json]
        ]
      end
        
      res.finish
    end
  end
  