import './globals.css';
import localFont from '@next/font/local';

const satoshi = localFont({
  variable: '--font-satoshi',
  src: [
    {
      path: '../public/fonts/satoshi/Satoshi-Variable.ttf',
      weight: '100 900',
      style: 'normal',
    },
    {
      path: '../public/fonts/satoshi/Satoshi-VariableItalic.ttf',
      weight: '100 900',
      style: 'italic',
    },
  ],
});

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en" className={`${satoshi.variable} font-sans`}>
      {/*
        <head /> will contain the components returned by the nearest parent
        head.tsx. Find out more at https://beta.nextjs.org/docs/api-reference/file-conventions/head
      */}
      <head />
      <body>{children}</body>
    </html>
  );
}
