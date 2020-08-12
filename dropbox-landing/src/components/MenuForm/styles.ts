import styled from "styled-components";
import { FaDropbox } from "react-icons/fa";

export const Container = styled.div`
  display: flex;
  flex-direction: column;
  height: 100%;

  @media (min-width: 1024px) {
    max-width: 480px;
  }
`;

export const Navigation = styled.nav`
  display: flex;
  align-items: center;
  justify-content: space-between;

  padding: 16px 32px;
  min-height: 61px;

  > h1 {
    display: flex;
    align-items: center;

    > span {
      font-size: 29px;
      margin-left: 10px;

      color: var(--color-quaternary);
    }
  }

  > button {
    background: none;
    border: none;
    outline: none;

    font-weight: bold;
    font-size: 17px;
    cursor: pointer;
  }

  @media (min-width: 1024px) {
    justify-content: flex-end;

    > h1 {
      display: none;
    }
  }
`;

export const DropboxLogo = styled(FaDropbox)`
  width: 36px;
  height: 32px;

  fill: var(--color-blue);
`;

export const Form = styled.form`
  display: flex;
  flex-direction: column;
  justify-content: center;

  height: 100%;
  padding: 0 32px;
  max-width: 480px;
  margin: 0 auto;

  > .title {
    font-size: 25px;
    font-weight: 500;
  }

  > .subtitle {
    font-size: 12px;
    margin-top: 3px;
  }

  > input {
    margin-top: 18px;

    font-size: 14px;
    padding: 13px 18px;
    border-radius: 2px;

    background: var(--color-tertiary);
    border: 1px solid var(--color-border);
  }

  > button {
    margin-top: 18px;

    border: none;
    font-size: 16px;
    padding: 13px 18px;
    border-radius: 2px;
    transition: opacity 0.15s;

    color: var(--color-tertiary);
    background: var(--color-blue);

    cursor: pointer;

    &:hover {
      opacity: 0.87;
    }
  }

  > .terms {
    font-size: 12px;
    opacity: 0.6;
    margin-top: 4px;
  }
`;
