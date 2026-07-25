const request = require('supertest');
const app = require('../server');

describe('Backend Server API & Security Endpoints', () => {
  it('GET /health should return status UP', async () => {
    const res = await request(app).get('/health');
    expect(res.statusCode).toEqual(200);
    expect(res.body).toHaveProperty('status', 'UP');
    expect(res.body).toHaveProperty('service', 'backend-api');
  });

  it('GET /live should return 200 OK', async () => {
    const res = await request(app).get('/live');
    expect(res.statusCode).toEqual(200);
    expect(res.text).toEqual('OK');
  });

  it('GET /metrics should return Prometheus metrics', async () => {
    const res = await request(app).get('/metrics');
    expect(res.statusCode).toEqual(200);
    expect(res.headers['content-type']).toMatch(/text\/plain/);
  });

  it('GET /api/v1/secure-data should return secure payload', async () => {
    const res = await request(app).get('/api/v1/secure-data');
    expect(res.statusCode).toEqual(200);
    expect(res.body).toHaveProperty('message');
  });
});
