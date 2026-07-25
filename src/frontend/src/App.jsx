import React, { useEffect, useState } from 'react';

export function App() {
  const [healthStatus, setHealthStatus] = useState('Checking...');
  const [secureMessage, setSecureMessage] = useState('');

  useEffect(() => {
    fetch('/health')
      .then((res) => res.json())
      .then((data) => setHealthStatus(data.status))
      .catch(() => setHealthStatus('Offline (Local / Standalone Mode)'));
  }, []);

  return (
    <div style={{ fontFamily: 'sans-serif', padding: '2rem', maxWidth: '800px', margin: '0 auto' }}>
      <header style={{ borderBottom: '2px solid #0052cc', paddingBottom: '1rem', marginBottom: '2rem' }}>
        <h1 style={{ color: '#0052cc', margin: 0 }}>DevSecOps Enterprise Dashboard</h1>
        <p style={{ color: '#5e6c84' }}>Zero-Trust Secure CI/CD & Security Architecture</p>
      </header>

      <main>
        <section style={{ background: '#f4f5f7', padding: '1.5rem', borderRadius: '8px', marginBottom: '1.5rem' }}>
          <h2>System Security Health Status</h2>
          <p>
            Backend API Health:{' '}
            <strong style={{ color: healthStatus === 'UP' ? '#36b37e' : '#ff5630' }}>
              {healthStatus}
            </strong>
          </p>
        </section>

        <section style={{ background: '#eae6ff', padding: '1.5rem', borderRadius: '8px' }}>
          <h2>Enforced Security Pipeline Features</h2>
          <ul>
            <li>✅ Gitleaks Secret Scanning (Zero Hardcoded Secrets)</li>
            <li>✅ Semgrep SAST & OWASP Top 10 Enforcements</li>
            <li>✅ Trivy Vulnerability & Container Image Scans</li>
            <li>✅ SonarQube Quality Gate Enforcement</li>
            <li>✅ Vercel Security Headers (CSP, HSTS, XSS, Frame Options)</li>
            <li>✅ Supabase Free Tier Auth & Row Level Security (RLS)</li>
          </ul>
        </section>
      </main>
    </div>
  );
}

export default App;
