from httpx import AsyncClient

async def test_get_specific_operations(ac: AsyncClient):
    response = await ac.get("/")
    assert response.status_code == 200

    # assert "Product 1" in response.content.decode()
    # assert response.json() == {"msg": "Hello World"}

