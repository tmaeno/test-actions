import json

@rest_api
def aaa(req, par):
    """
    get:
      summary: Returns a list of users.
      description: Optional extended description in CommonMark or HTML
      parameters:
      - in: query
        name: par
        schema:
          type: string
        description: The number of items to skip before starting to collect the result set
      responses:
        "200":
          description: A JSON array of strings
          content:
            application/json:
              schema:
                type: array
                items:
                  type: string
    """
    return json.dumps([par])
