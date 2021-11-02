defmodule HelloBoltech do
  @moduledoc """
  Documentation for `HelloBoltech`.
  """
  alias BoltechClient
  alias Tesla.Multipart

  def hello(first_name, last_name, role, referrer, file_resume, file_source) do
    IO.puts("Hello Boltech")
    {:ok, response} = BoltechClient.get_data()

    # Extract data from body
    %{"id" => id, "nums" => nums} = response.body

    # Prepare the json structure
    data = %{
      "applicant" => %{
        "firstName" => first_name,
        "lastName" => last_name
      },
      "role" => role,
      "referrer" => referrer,
      "answer" => %{
        "questionId" => id,
        "sum" => Enum.sum(nums) # Calculate sum of the array
      }
    }

    # Convert map to json
    {:ok, json_payload} = Jason.encode(data)

    # Prepare multipart form data
    multipart =
      Multipart.new()
      |> Multipart.add_field("application", json_payload,
        headers: [{"content-type", "application/json"}]
      )
      |> Multipart.add_file(file_resume, name: "file")
      |> Multipart.add_file(file_source, name: "source")

    # Pass payload to the API client
    BoltechClient.post_data(multipart)
  end
end
