import json

@rest_api
def aaa(req, par):
    """
    get:
      summary: Returns a list of users.
      description: Optional extended description in CommonMark or HTML
      parameters:
        - in: par
          name: userId
          schema:
            type: integer
          required: true
          description: Numeric ID of the user to get
      responses:
        "200":
          description: A JSON array of user names
          content:
            application/json:
              schema:
                type: array
                items:
                  type: string
    """
    return json.dumps([par])
