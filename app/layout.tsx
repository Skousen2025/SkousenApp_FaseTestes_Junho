// app/layout.tsx
import './globals.css';

export const metadata = {
  title: 'Skousen App',
  description: 'Gerenciamento de instalações',
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="pt">
      <body>{children}</body>
    </html>
  );
}
