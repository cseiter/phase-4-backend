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
  
      #show single badge by index
      if req.path.match('/items/') && req.get?
        badge_id = req.path.split('/')[2]
        begin
          badge_details = Item.find(badge_id)
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
        
      res.finish
    end
  end
  