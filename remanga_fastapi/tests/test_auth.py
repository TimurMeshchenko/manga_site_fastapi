from httpx import AsyncClient

async def test_set_csrf_token_in_cookie(ac: AsyncClient) -> None:
    response = await ac.get("/signin")

    assert response.cookies.get("csrf_token")
