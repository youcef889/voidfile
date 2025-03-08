const About = () => {
  return (
    <>
      <title>TA | About</title>

      <div className="boxed-content">
        <div className="title-bar">
          <h1>About The Tube Archivist</h1>
        </div>
        <div className="about-section">
          <h2>Useful Links</h2>
          <p>
            This project is in active and constant development, take a look at the{' '}
            <a href="https://github.com/tubearchivist/tubearchivist#roadmap" target="_blank">
              roadmap
            </a>{' '}
            for a overview.
          </p>
          <p>
            All functionality is documented in our up-to-date{' '}
            <a href="https://docs.tubearchivist.com" target="_blank">
              user guide
            </a>
            .
          </p>
          <p>
            All contributions are welcome: Open an{' '}
            <a href="https://github.com/tubearchivist/tubearchivist/issues" target="_blank">
              issue
            </a>{' '}
            for any bugs and errors, join us on{' '}
            <a href="https://www.tubearchivist.com/discord" target="_blank">
              Discord
            </a>{' '}
            to discuss details. The{' '}
            <a
              href="https://github.com/tubearchivist/tubearchivist/blob/master/CONTRIBUTING.md"
              target="_blank"
            >
              contributing
            </a>{' '}
            page is a good place to get started.
          </p>
        </div>
        <div className="about-section">
          <h2>Donate</h2>
          <p>
            Here are{' '}
            <a href="https://github.com/tubearchivist/tubearchivist#donate" target="_blank">
              some links
            </a>
            , if you want to buy the developer a coffee. Thank you for your support!
          </p>
        </div>
      </div>
    </>
  );
};

export default About;
