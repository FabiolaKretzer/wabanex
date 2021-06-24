# Wabanex (Api Graphql)
--- Gerencie e acompanhe seus treinos de academia ---

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Exemples Queries and Mutations Graphql

### Create user

```graphql
mutation {
  createUser(input: {
    name: "Fabi",
    email: "fabi@kk.com",
    password: "123456"
  }) {
    id
    name
  }
}
```

### Get user

```graphql
{
  getUser(id: "d3b00dfc-9b45-4fc6-b7b4-7d6c550512e4") {
    name,
    email
  }
}
```

### Create training and exercises

```graphql
mutation {
  createTraining(input: {
    	startDate: "2021-06-03",
    	endDate: "2021-07-03",
    	userId: "e3d985b6-b870-4f4b-be89-bb290ecb880d",
    	exercises: [
        {
          name: "Triceps banco",
          youtubeVideoUrl: "www.triceps.com",
          repetitions: "3x10",
          protocolDescription: "drop-set"
        },
        {
          name: "Triceps corda",
          youtubeVideoUrl: "www.triceps.com",
          repetitions: "3x10",
          protocolDescription: "regular"
        }
      ]
  }) {
    id,
    exercises{
      id,
      name
    }
  }
}
```