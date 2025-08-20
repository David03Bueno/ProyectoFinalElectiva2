const request = require("supertest");
const app = require("../src/server");

describe("GET /", () => {
  it("responde con Hola Mundo DevOps", async () => {
    const res = await request(app).get("/");
    expect(res.status).toBe(200);
    expect(res.text).toMatch(/Hola Mundo DevOps/i);
  });
});
