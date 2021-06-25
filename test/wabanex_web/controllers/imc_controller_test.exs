defmodule WabanexWeb.IMCControlerTest do
  use WabanexWeb.ConnCase, async: true

  describe "index/2" do
    test "when all params are valid, returns the imc info", %{conn: conn} do
      params = %{"filename" => "students.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:ok)

      expected_response = %{
        "result" => %{
          "Gabriel" => 24.801587301587304,
          "Manu" => 21.20310522895934,
          "Mari" => 20.747550193111813,
          "Rafael" => 24.897060231734173,
          "Rodrigo" => 26.722872520606725
        }
      }

      assert response == expected_response
    end

    test "when there invalid params, returns an error", %{conn: conn} do
      params = %{"filename" => "banana.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:bad_request)

      expected_response = %{"result" => "Error while opening the file"}

      assert response == expected_response
    end
  end
end
